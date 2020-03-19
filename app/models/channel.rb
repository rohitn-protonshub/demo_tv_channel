class Channel < ApplicationRecord
	has_many :channel_shows

	def shows_count
		channel_shows.count
	end
end
