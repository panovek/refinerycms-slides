# Slides extension for Refinery CMS.

Yes, sliders are evil. However, they remain quite common, and this
is a simple RefineryCMS extension to add user-friendly slider management.

It also works great to put a random static image on the homepage.

## Installation

    # Gemfile:
    gem 'refinerycms-slides', :github => 'tortus/refinerycms-slides', :branch => '2-1-stable'

    $ bundle install
    $ rails generate refinery:slides
    $ rake db:migrate
    $ rake db:seed

## Usage

There aren't any partials or helpers to learn, since every slider is different.
Typically you will want to do something like:

```ruby
# app/decorators/controllers/refinery/pages_controller_decorator.rb
Refinery::PagesController.class_eval do

  before_filter :set_slides, :if => lambda { home_page? }

  private

  def set_slides
    @slides = Refinery::Slides::Slide.live.by_position
  end

end
```
```erb
# app/views/refinery/pages/home.html.erb
<% @slides.each do |slide| %>
  # Generate html for each slide.
<% end %>
```

To fetch a single random slide instead (postgres only), use:

```ruby
Refinery::Slides:Slide.random_slide
```

Slides have the following columns, for use in whatever way seems best:

* title (string)
* link (string)
* image (refinery image)
* content (text)
* hidden (boolean)

## Nivo Slider

Assets for the popular Nivo Slider are included. To use:

    application.js:
    //= require jquery.nivo.slider

    application.css:
    *= require nivo-slider.css
