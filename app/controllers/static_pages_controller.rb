class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @goal = current_user.goals.build
      @feed_goals = current_user.goals.where("active = ?", true)
      @feed_goals = @feed_goals.paginate(page: params[:page], :per_page => 5)
      @feed_goals_inactive = current_user.goals.where("active = ?", false)
      @feed_goals_inactive = @feed_goals_inactive.paginate(page: params[:page], :per_page => 5)
    end
  end
end
