module Refinery
  module Slides
    module Admin
      class SlidesController < ::Refinery::AdminController

        crudify :'refinery/slides/slide', :xhr_paging => true

        protected

        def slide_params
          params.require(:slide).permit(:title, :link, :content, :image_id, :hidden, :position, :live_at, :down_at)
        end

      end
    end
  end
end
