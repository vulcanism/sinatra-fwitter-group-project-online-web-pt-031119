class UsersController < ApplicationController
  
  get "/signup" do
    if logged_in?
      redirect "/tweets"
    else
      erb :"/users/signup"
    end
  end
  
  post "/signup" do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/signup"
    end
  end
  
  get "/login" do
    if !logged_in?
      erb :"/users/login"
    else
      redirect "/tweets"
    end
  end
  
  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.
  end


end
