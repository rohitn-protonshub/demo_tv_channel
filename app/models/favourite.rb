class Favourite < ApplicationRecord
	belongs_to :user
	belongs_to :channel_show

	after_create :schedule_notification_for_user


	def schedule_notification_for_user
		time = self.channel_show.show_time.split(":")
		time = Time.now + (time.first.to_i.hours) + (time.last.to_i.minutes) - 30.minutes
		EmailWorker.perform_at(time,"send_notification",self.id)
	 end 
end
