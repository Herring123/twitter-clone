class UsersController < ApplicationController


  def show

    @user = User.find(params[:id])
    authorize @user
    @tweets = @user.tweets.order('created_at DESC')


  end
end
