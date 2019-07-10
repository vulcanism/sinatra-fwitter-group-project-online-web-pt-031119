class UsersController < ApplicationController
  
  get "/signup" do
    erb :"/users/signup"
  end
  
  post "/signup" do
    if params[:username] != ""
      @user = User.new(params)
      @user.save
      redirect "/tweets"
    end
  end


end
