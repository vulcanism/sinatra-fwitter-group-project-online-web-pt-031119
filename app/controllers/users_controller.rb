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


end
