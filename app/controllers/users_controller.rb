class UsersController < ApplicationController
  def index
    @users = User.all
    @users_count = User.count
  end
  def new
    
  end

end
