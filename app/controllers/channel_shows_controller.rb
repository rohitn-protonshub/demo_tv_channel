class ChannelShowsController < ApplicationController
	before_action :authenticate_user!

	def index
		if params[:search_term].present?
      @shows = ChannelShow.where("name LIKE ?","%#{params[:search_term]}%") + ChannelShow.joins(:channel).where("channels.name LIKE ?", "%#{params[:search_term]}%") 
		  @shows.uniq
		end
    @shows ||= ChannelShow.all
	end




end
