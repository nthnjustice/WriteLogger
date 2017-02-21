class StaticPagesController < ApplicationController
  require 'will_paginate/array'

  def home
    if logged_in?
      @group_feed = Micropost.all
      @group_feed = @group_feed.paginate(page: params[:group_feed_page], :per_page => 5)

      @active_goals_feed = current_user.goals.where("active = ?", true)
      @active_goals_feed = @active_goals_feed.sort_by &:deadline
      @active_goals_feed = @active_goals_feed.paginate(page: params[:active_goal_feed_page], :per_page => 5)

      @inactive_goals_feed = current_user.goals.where("active = ?", false)
      @inactive_goals_feed = @inactive_goals_feed.sort_by &:deadline
      @inactive_goals_feed = @inactive_goals_feed.paginate(page: params[:inactive_goal_feed_page], :per_page => 5)
    end
  end
end
