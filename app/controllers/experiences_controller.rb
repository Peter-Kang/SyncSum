class ExperiencesController < ApplicationController

  def new
    @experience = current_user.candidate.experiences.build
    @experience.job_functions.build
    @experience.business_sectors.build
    
    # expires_now
    render partial: 'form' if request.xhr?
  end

  def create
    @experience = current_user.candidate.experiences.new(params[:experience])

    if @experience.save
      if request.xhr?
        render partial: 'experience', locals: { experience: @experience }
      else
        redirect_to profile_path, notice: "Experience was successfully created."
      end
    else
      if request.xhr?
        render partial: 'shared/error_messages', status: :unprocessable_entity, locals: { object: @experience }
      else
        render :new
      end
    end
  end

  def show
    @experience = Experience.find(params[:id])
  end
end
