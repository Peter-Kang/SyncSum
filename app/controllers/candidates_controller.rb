class CandidatesController < ApplicationController
  
  def index
    @search = Candidate.search(params[:q])
    @candidates = @search.result
  end
  
  def new
    @candidate = Candidate.new
    @candidate.build_user
      
    render :layout => false
  end

  def create
    @candidate = Candidate.new(params[:candidate])

    if @candidate.save
      sign_in @candidate.user
      redirect_to dashboard_path, notice: "Candidate was successfully created"
    else
      render "devise/sessions/new", :layout => "authentication"
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])

    render partial: 'vitals_form' if request.xhr?
  end

  def update
    @candidate = Candidate.find(params[:id])
    @user = @candidate.user

    if @candidate.update_attributes(params[:candidate])
      if request.xhr?
        render partial: 'vitals'
      else
        redirect_to profile_path, notice: "Changes saved"
      end
    else
      if request.xhr?
        render partial: 'vitals'
      else
        render "#{current_user.plural_type}/show"
      end
    end
  end

end
