class CreateChannelShows < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_shows do |t|
    	t.string :name
    	t.integer :channel_id
    	t.string :show_time
    	t.integer :duration
      t.timestamps
    end
  end
end
