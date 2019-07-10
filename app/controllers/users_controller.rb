class UsersController < ApplicationController
  
  get "/signup" do
    erb :"/users/signup"
  end
  
  post "/signup" do
    @user = User.new(params)
    @user.save
    redirect "/tweets"
  end


end
