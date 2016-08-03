class LikesController < ApplicationController
  def like
    @event= Event.find(params[:event_id])
    like = current_user.likes.build(event_id: @event.id)
    like.save
  end

  def unlike
    @event = Event.find(params[:event_id])
    like = current_user.likes.find_by(event_id: @event.id)
    like.destroy
  end
end
