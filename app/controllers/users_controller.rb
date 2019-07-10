class UsersController < ApplicationController
  
  get "/signup" do
    if logged_in?
  else
    erb :"/users/signup"
  end
  
  post "/signup" do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.new(params)
      @user.save
      redirect "/tweets"
    else
      redirect "/signup"
    end
    
  end


end
