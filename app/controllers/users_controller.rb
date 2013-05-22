class UsersController < ApplicationController
# basic CRUD

	def index
		@users = User.all
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to users_path
    else
      render :action => :edit
    end
	end  

	def show
    @user = User.find params[:id]
  end
end
