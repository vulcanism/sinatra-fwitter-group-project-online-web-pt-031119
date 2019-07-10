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
    
  end


end
