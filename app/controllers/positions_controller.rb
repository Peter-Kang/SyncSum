class PositionsController < ApplicationController

  def new
    @position = current_user.employer.positions.build
    
    # expires_now
    render partial: 'form' if request.xhr?
  end

  def index
    @search = Position.search(params[:q])
    @positions = @search.result
    @myApps = current_user.candidate.candidate_apps.pluck(:position_id)
  end

  def create
    @position = current_user.employer.positions.build(params[:position])
    
    if @position.save
      redirect_to profile_path, notice: "Successfully created position"
    else
      render "#{@user.plural_type}/show"
    end
  end

  def update
    @position = current_user.position.find(params[:id])

    if @position.update_attributes(params[:position])
      redirect_to profile_path, notice: "Successfully updated position"
    else
      render render "#{@user.plural_type}/show"
    end
  end

  def destroy
    @position = current_user.positions.find(params[:id])
    @position.destroy

    flash[:success] = "Position successfully removed"
    redirect_to profile_path
  end
end
