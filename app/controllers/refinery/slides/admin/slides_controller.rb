module Refinery
  module Slides
    module Admin
      class SlidesController < ::Refinery::AdminController

        crudify :'refinery/slides/slide', :xhr_paging => true

        # override because acts_as_indexed dont work with utf8
        def index
          if params[:search].present?
            @slides = Slide.where('LOWER(title) ILIKE ?', "%#{params[:search].downcase}%")
          else
            @slides = Slide.all
          end
          @slides = @slides.order('created_at desc').paginate(:page => params[:page])
        end

        protected

        def slide_params
          params.require(:slide).permit(:title, :link, :content, :image_id, :hidden, :position, :live_at, :down_at)
        end

      end
    end
  end
end
