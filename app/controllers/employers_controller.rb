class EmployersController < ApplicationController

  def index
    @search = Employer.search(params[:q])
    @employers = @search.result
  end

  def edit
    @employers= Employer.find(params[:id])

    render partial: 'vitals_form' if request.xhr?
  end

  def new
    @employer = Employer.new
    @employer.build_user

    render :layout => false
  end

  def create
    @employer = Employer.new(params[:employer])

    if @employer.save
      sign_in @employer.user
      redirect_to dashboard_path, notice: "Employer was successfully created"
    else
      # flash[:error] = @employer.errors.full_messages
      render "devise/sessions/new", :layout => "authentication"
    end
  end

  def update
    @employer = Employer.find(params[:id])

    if @employer.update_attributes(params[:employer])
      redirect_to profile_path, notice: "Changes saved"
    else
      render "#{current_user.plural_type}/show"
    end
  end

  def search
    index
    render :index
  end
  
end
