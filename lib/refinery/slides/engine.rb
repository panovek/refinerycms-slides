module Refinery
  module Slides
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Slides

      engine_name :refinery_slides

      initializer "register refinerycms_slides plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "slides"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.slides_admin_slides_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/slides/slide'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Slides)
      end
    end
  end
end
