class AddLiveAtAndDownAtToSlides < ActiveRecord::Migration

  def up
    add_column :refinery_slides, :live_at, :datetime
    add_column :refinery_slides, :down_at, :datetime
    ::Refinery::Slides::Slide.where(:live_at => nil).update_all(:live_at => Time.zone.now)
  end

  def down
    remove_column :refinery_slides, :down_at
    remove_column :refinery_slides, :live_at
  end

end
