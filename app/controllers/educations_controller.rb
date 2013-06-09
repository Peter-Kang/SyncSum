class EducationsController < ApplicationController

  def new
    @education = current_user.candidate.educations.build

    render partial: 'form' if request.xhr?
  end

  def create
    @education = current_user.candidate.educations.build(params[:education])

    if @education.save
      if request.xhr?
        render partial: 'education', locals: { education: @education }
      else
        redirect_to profile_path, notice: "Education was successfully created."
      end
    else
      if request.xhr?
        render partial: 'shared/error_messages', status: :unprocessable_entity, locals: { object: @education }
      else
        render :new
      end
    end
  end

  def update
    @education = Education.find(params[:id])
    
    if @education.update_attributes(params[:education])
      flash[:success] = "Education successfully updated"
      redirect_to profile_path
    else
      render "#{current_user.plural_type}/show"
    end
  end

  def destroy
    @education = Education.find(params[:id])
    @education.destroy

    flash[:success] = "Education successfully removed"
    redirect_to profile_path
  end
end
