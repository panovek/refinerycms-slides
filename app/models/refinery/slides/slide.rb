module Refinery
  module Slides
    class Slide < Refinery::Core::BaseModel
      self.table_name = 'refinery_slides'

      belongs_to :image, :class_name => '::Refinery::Image'

      acts_as_indexed :fields => [:title, :link, :content]

      validates :title, :presence => true, :uniqueness => true
      validates :image, :presence => true
      validates :live_at, :presence => true

      def live?
        now = Time.zone.now
        !hidden? && image.present? && live_at <= now && (down_at.blank? || now < down_at)
      end

      def upcoming?
        !hidden? && image.present? && live_at > Time.zone.now
      end

      def self.live
        where('NOT hidden AND image_id IS NOT NULL AND live_at <= :now AND (down_at IS NULL OR :now < down_at)', :now => Time.zone.now)
      end

      def self.live_slide
        live.by_date.first
      end

      def link?; not link.blank?; end

      def self.by_date; order("live_at DESC, down_at DESC"); end
      def self.by_position; order("position ASC"); end
      def self.by_random; order("random()"); end

      def self.random_slide
        live.by_random.first
      end

    end
  end
end
