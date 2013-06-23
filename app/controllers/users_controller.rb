
class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]

  def show
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    @unRead = Message.where(:recipientID => current_user.email, :isRead => false)


    if @user.candidate?
      @candidate   = @user.candidate
      @educations  = @candidate.educations.delete_if(&:new_record?)
      @experiences = @candidate.experiences
    elsif @user.employer?
      @employer = @user.employer
      @positions = @employer.positions
      if current_user.candidate?
        @myApps = current_user.candidate.candidate_apps.pluck(:position_id)
      end
    end

    render "#{@user.plural_type}/show"
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def dashboard
    @messages = Message.where(:recipientID => current_user.id)
    @unRead = Message.where(:recipientID => current_user.email, :isRead => false)
    session[:skip_question_ids] ||= []
    session[:skip_question_ids] << params[:skip_question_id] if params[:skip_question_id].present?
    @questions = Question.unanswerred(current_user, session[:skip_question_ids]).sample(3)
    @results = Employer.all.sample(3)
    @recommended = Employer.all.sample(3)
    if(current_user.employer && current_user.isAdmin)
      @myUsers = User.all
    end

    while @questions.size < 3 do
      @questions << Question.all.sample
      # Question.where(['id NOT IN (?)', session[:skip_question_ids]]).sample
      # this is the query you want to use when there are enough 
      # questions in the database
      @questions.uniq!
    end
    render "#{current_user.plural_type}/dashboard"
  end

  def choose_type
    render :layout => false
  end
end
