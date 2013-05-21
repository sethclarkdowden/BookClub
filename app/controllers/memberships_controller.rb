class MembershipsController < ApplicationController
	def index
		@memberships = Membership.all
	end

	def new
		@membership = Membership.new
	end

	def create
		@membership = Membership.new params[:membership]
		if @membership.save
			redirect_to users_path
		end
	end
end
