class UsersController < ApplicationController


  def show

    @user = User.find(params[:id])
    @tweets = @user.tweets.order('created_at DESC')
    authorize @user
  end

  def follow
     @user = User.find(params[:id])
      current_user.follow(@user)
      redirect to user_path(@user)
    # @current_user.follow(@user)
    # @follow = Follow.find_by(follower: @current_user, followable: @user)
    # respond_to :js
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
    # @current_user.stop_following(@user)
    # respond_to :js
  end
end
