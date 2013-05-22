class ClubsController < ApplicationController
	# basic CRUD

	def index
		@clubs = Club.all
	end

	def new
		@club = Club.new
	end

	def create
		@club = Club.new params[:club]
		if @club.save
			redirect_to clubs_path
		else 
			render :action => 'new'
		end
	end

	def edit
		@club = Club.find params[:id]
	end

	def update
		@club = Club.find params[:id]
    if @club.update_attributes params[:club]
      redirect_to clubs_path
    else
      render :action => :edit
    end
	end 

	def destroy
		@club = Club.find params[:id]
    @club.destroy
    redirect_to clubs_path
	end 

	def show
    @club = Club.find params[:id]
    @membership = Membership.new
		@is_member = @club.users.any? {|u| u.id == current_user.id}
		@member = Membership.all
		@member.each do |m|
			if m.club_id == @club.id && m.user_id == current_user.id
				@member = m
			end
		end


  end

end
