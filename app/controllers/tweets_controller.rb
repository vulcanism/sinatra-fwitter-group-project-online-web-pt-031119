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
    if params[:content] != "" 
      @tweet = Tweet.new(content: params[:content])
      @tweet.user = current_user
      @tweet.save
      redirect "/tweets/#{@tweet.id}"
    else
      redirect "/tweets/new"
    end
  end
  
  get "/tweets/:id" do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :"/tweets/show"
    else
      redirect "/login"
    end
  end
  
  get "/tweets/:id/edit" do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
        if @tweet && @tweet.user == current_user
          erb :"/tweets/edit"
        end
    else
      redirect "/login"
    end
  end
  
  patch "/tweets/:id" do
    @tweet = Tweet.find_by_id(params[:id])
    if params[:content] != ""
      @tweet.update(content: params[:content])
      redirect "/tweets/#{@tweet.id}"
    else
      redirect "/tweets/#{@tweet.id}/edit"
    end
  end
  
  delete "/tweets/:id/delete" do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      if @tweet && @tweet.user == current_user
        @tweet.delete
      end
        redirect "/tweets"
    else
      redirect "/login"
    end
  end


end
