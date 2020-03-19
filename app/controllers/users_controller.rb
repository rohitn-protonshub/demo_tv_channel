class UsersController < ApplicationController
	before_action :set_show

	def all_favourite_shows
		@shows = current_user.channel_shows
	end

    def favourite_show
		favourite = @show.favourites.create(user_id: current_user.id)
		redirect_to channel_shows_path
	end

	def unfavourite_show
		favourite = @show.favourites.find_by(user_id: current_user.id)
		favourite.destroy
		redirect_to channel_shows_path
	end

  private
    def set_show
		@show = ChannelShow.find_by(id: params[:id])		
	end
end
