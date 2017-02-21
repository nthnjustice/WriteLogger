class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.total = (@micropost.hours * 60) + @micropost.minutes
    if @micropost.save
      flash[:success] = "Writing log saved"
      redirect_to root_url
    else
      flash[:success] = "Error saving log"
      redirect_to root_url
    end
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @micropost = @user.microposts.find_by_id(params[:id])
    @micropost.destroy
    flash[:success] = "Writing log deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :hours, :minutes, :author, :total)
    end
end
