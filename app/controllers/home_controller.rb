class HomeController < ApplicationController
    def top
      if user_signed_in?
        @event = Event.new
        @events = Event.all
      end
    end

    def about
    end

end
