class TweetsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

   def index
    # @tweets = Tweet.all.order("created_at DESC")
    @tweets = Tweet.paginate(page: params[:page], per_page: 7).order('created_at DESC')

    @tweet = Tweet.new
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    # @tweet = Tweet.new
  end

  def create
    # @user = current_user
    @user = User.find(params[:user_id])
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @user
    if @tweet.save
    redirect_to user_tweets_path
  end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
