class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:success] = "Goal saved"
      redirect_to root_url
    else
      flash[:success] = "Error saving goal"
      redirect_to request.referrer || root_url
    end
  end

  def deactivate_goal
  	@goal = current_user.goals.find_by_id(params[:id])
  	if @goal.update_attribute :active, false
  		flash[:success] = "Goal marked achieved"
  		redirect_to root_url
  	end
  end

  def destroy
  	@goal = current_user.goals.find_by_id(params[:id])
  	@goal.destroy
  	flash[:success] = "Goal has been deleted"
  	redirect_to request.referrer || root_url
  end

  private

  	def goal_params
      params.require(:goal).permit(:description, :deadline)
    end

    def correct_user
      @goal = current_user.goals.find_by(id: params[:id])
      redirect_to root_url if @goal.nil?
    end
end
