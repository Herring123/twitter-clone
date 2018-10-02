class TweetsController < ApplicationController
  # before_action :authenticate_user!, :except => [:index]

   def index
    # @tweets = Tweet.all.order("created_at DESC")
    @tweets = policy_scope(Tweet).paginate(page: params[:page], per_page: 7).order('created_at DESC')
    @tweet = Tweet.new
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
  end

  def create
    # @user = current_user
    @user = User.find(params[:user_id])
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @user
    authorize @tweet

    if @tweet.save
    redirect_to user_tweets_path
    else
      redirect_to user_tweets_path
  end
  end



    #      respond_to do |format|
    #     format.html { redirect_to user_tweets_path }
    #     format.js
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render 'tweets/index' }
    #     format.js

    # end


  def edit
    @tweet = Tweet.find(params[:id])
    @user = current_user
    authorize @tweet
  end

  def update

    @tweet = Tweet.find(params[:id])
    authorize @tweet
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    authorize @tweet
    @tweet.destroy

    redirect_to tweets_path

  end

  def upvote
  @tweet = Tweet.find(params[:id])
  @tweet.upvote_by current_user
  respond_to do |format|
    format.html {redirect_to :tweets}
    format.js {render "vote"}
    # redirect_to :tweets
  # redirect_to :tweets
  #  if request.xhr?
  #   head :ok
  # else
  end
end

def downvote
  @tweet = Tweet.find(params[:id])
  @tweet.downvote_by current_user
  respond_to do |format|
    format.html {redirect_to :tweets}
    format.js {render "vote"}
  # redirect_to :tweets
end
end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end













