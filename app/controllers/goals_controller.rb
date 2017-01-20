class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user, only: [:destroy, :update]
  require 'will_paginate/array' 

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:success] = "Goal saved"
      redirect_to root_url
    else
    	@feed_items = Micropost.all
      @feed_items = @feed_items.paginate(:page => 1, :per_page => 5)
      @feed_goals = current_user.goals.where("active = ?", true)
      @feed_goals = @feed_goals.paginate(page: params[:page], :per_page => 5)
      @feed_goals_inactive = current_user.goals.where("active = ?", false)
      @feed_goals_inactive = @feed_goals_inactive.paginate(page: params[:page], :per_page => 5)
      render 'static_pages/home'
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
