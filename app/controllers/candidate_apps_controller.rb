class CandidateAppsController < ApplicationController
  # GET /candidate_apps
  # GET /candidate_apps.json
  def index
  
  	if(current_user.employer)
  		@myApps = CandidateApp.where(:position_id => current_user.employer.id)
  	else
  		@myApps = current_user.candidate.candidate_apps
    end
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidate_apps }
    end
  end

  # GET /candidate_apps/1
  # GET /candidate_apps/1.json
  def show
    @candidate_app = CandidateApp.where(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate_app }
    end
  end

  # GET /candidate_apps/new
  # GET /candidate_apps/new.json
  def new
    @candidate_app = CandidateApp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate_app }
    end
  end

  # GET /candidate_apps/1/edit
  def edit
    @candidate_app = CandidateApp.find(params[:id])
  end

  # POST /candidate_apps
  # POST /candidate_apps.json
  def create
    @candidate_app = current_user.candidate.candidate_apps.build(:position_id => params[:position_id])
    @candidate_app.candidate_app_status_id = 1
    respond_to do |format|
      if @candidate_app.save
        format.html { redirect_to positions_path, notice: 'Successfully applied to job.' }
      else
        format.html { redirect_to positions_path, notice: 'There were problems applying.' }
      end
    end
  end

  # PUT /candidate_apps/1
  # PUT /candidate_apps/1.json
  def update
    @candidate_app = CandidateApp.find(params[:id])

    respond_to do |format|
      if @candidate_app.update_attributes(params[:candidate_app])
        format.html { redirect_to @candidate_app, notice: 'Candidate app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_apps/1
  # DELETE /candidate_apps/1.json
  def destroy
    @candidate_app = CandidateApp.find(params[:id])
    @candidate_app.destroy

    respond_to do |format|
      format.html { redirect_to candidate_apps_url }
      format.json { head :no_content }
    end
  end
end
