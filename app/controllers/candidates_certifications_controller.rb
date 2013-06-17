class CandidatesCertificationsController < ApplicationController
  # GET /candidates_certifications
  # GET /candidates_certifications.json
  def index
    @candidates_certifications = CandidatesCertification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates_certifications }
    end
  end

  # GET /candidates_certifications/1
  # GET /candidates_certifications/1.json
  def show
    @candidates_certification = CandidatesCertification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidates_certification }
    end
  end

  # GET /candidates_certifications/new
  # GET /candidates_certifications/new.json
  def new
    @candidates_certification = CandidatesCertification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidates_certification }
    end
  end

  # GET /candidates_certifications/1/edit
  def edit
    @candidates_certification = CandidatesCertification.find(params[:id])
  end

  # POST /candidates_certifications
  # POST /candidates_certifications.json
  def create
    @candidates_certification = CandidatesCertification.new(params[:candidates_certification])

    respond_to do |format|
      if @candidates_certification.save
        format.html { redirect_to @candidates_certification, notice: 'Candidates certification was successfully created.' }
        format.json { render json: @candidates_certification, status: :created, location: @candidates_certification }
      else
        format.html { render action: "new" }
        format.json { render json: @candidates_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidates_certifications/1
  # PUT /candidates_certifications/1.json
  def update
    @candidates_certification = CandidatesCertification.find(params[:id])

    respond_to do |format|
      if @candidates_certification.update_attributes(params[:candidates_certification])
        format.html { redirect_to @candidates_certification, notice: 'Candidates certification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidates_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates_certifications/1
  # DELETE /candidates_certifications/1.json
  def destroy
    @candidates_certification = CandidatesCertification.find(params[:id])
    @candidates_certification.destroy

    respond_to do |format|
      format.html { redirect_to candidates_certifications_url }
      format.json { head :no_content }
    end
  end
end
