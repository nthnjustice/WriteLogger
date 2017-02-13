class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
    @posts = User.all.map { |u| u.microposts.first }
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 5)
    @goals_active = @user.goals.where("active = ?", true)
    @goals_active = @goals_active.paginate(:page => params[:page], :per_page => 5)
    @goals_inactive = @user.goals.where("active = ?", false)
    @goals_inactive = @goals_inactive.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Account successfully created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @microposts = @user.microposts
      @microposts.update_all(:author => @user.name)
      flash[:success] = "Profile successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User successfully deleted"
    redirect_to users_url
  end

  def user_microposts_json
    @user = User.find(params[:id])
    @microposts = @user.microposts
    render json: @microposts
  end

  def user_weekly_microposts_json
    @user = User.find(params[:id])
    @microposts = @user.microposts.where("created_at >= ?", Time.now-6.days)
    render json: @microposts
  end

  def group_microposts_json
    @microposts = Micropost.all
    render json: @microposts
  end

  def get_all_users_json
    @users = User.all
    render json: @users
  end

  def writing_report_json
    start_date = params[:start_date].to_date.beginning_of_day
    end_date = params[:end_date].to_date.end_of_day
    @microposts = Micropost.where(:created_at => start_date..end_date)
    render json: @microposts
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end