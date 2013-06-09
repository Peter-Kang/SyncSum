class QuestionsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [ :answer, :answers, :answer_question, :update_answer ]

  def index
    @questions = Question.sort(params[:newest], params[:oldest], params[:answer], params[:review], Category.find_by_name(params[:category]), Importance.find_by_level(params[:importance]), session[:skip_question_ids], current_user)#.paginate(:page => params[:page], :per_page => 4)

    #@professional, @social, @personal = [], [], []

    # 3.times do |i| 
    #   @professional << Question.professional.sample
    #   @social << Question.social.sample
    #   @personal << Question.personal.sample
    # end

    respond_to do |format|
      format.html { render "#{current_user.plural_type}/questions"}
      format.json { render :json => @questions }
    end
  end

  def show
    respond_to do |format|
      format.html { render :partial => "show", :locals => { :existing_answer => @question.answered(current_user.type_object), :question => @question } }
      format.json { render :json => @question }
    end
  end

  def new
    unauthorized! if cannot? :prefer, @question
    4.times { @question.answers.build }
  end

  def edit
  end

  def create
    # unauthorized! if cannot? :prefer, @question
    @question.employer = current_user.employer

    respond_to do |format|
      if @question.save
        format.html { redirect_to :action => :index, :notice => 'Question was successfully created.' }
        format.json { render :json => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    # unauthorized! if cannot? :prefer, @question
    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to :action => :index, :notice => 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    unauthorized! if cannot? :prefer, @question
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def answers
    @answered_questions = current_user.type_object.answers.map { |a| { :answer => a, :question => a.question } }

    respond_to do |format|
      format.html
      format.json { render :json => @answered_questions }
    end
  end

  def answer
    @answer = current_user.type_object.answers.from_question(@question).first
    unauthorized! if cannot? :answer, @question
    respond_to do |format|
      format.html 
      format.json { render :json => { :question => @question, :answer => @answer.first } }
    end
  end

  def answer_question
    @answer = @question.answers.find(params[:answer_id])
    current_user.type_object.add_answer(@answer)
    current_user.type_object.save

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => @answer }
    end
  end

  def update_answer
    @answer = @question.answers.find(params[:answer_id])
    current_user.type_object.add_answer_for_question(@answer)
    current_user.type_object.save

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => @answer }
    end
  end
end
