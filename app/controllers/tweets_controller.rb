class TweetsController < ApplicationController
  
  get "/tweets" do
    if logged_in?
      @tweets = Tweet.all
      erb :"/tweets/index"
    else
      redirect "/login"
    end
  end
  
  get "/tweets/new" do
    if logged_in?
      erb :"/tweets/new"
    else
      redirect "/login"
    end
  end
  
  post "/tweets" do
    @tweet = Tweet.new(params)
    binding.pry
    @tweet.user = current_user
    @tweet.save
    redirect "/tweets"
  end


end
