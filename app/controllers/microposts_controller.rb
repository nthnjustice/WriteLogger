class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  require 'will_paginate/array' 

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.total = (@micropost.hours * 60) + @micropost.minutes
    @micropost.hours = @micropost.total / 60
    @micropost.minutes = (@micropost.total % 60)
    if @micropost.save
      flash[:success] = "Writing log saved!"
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

  def destroy
    @micropost = current_user.microposts.find_by_id(params[:id])
    @micropost.destroy
    flash[:success] = "Writing log deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :hours, :minutes, :author, :total)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
