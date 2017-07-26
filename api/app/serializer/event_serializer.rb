# frozen_string_literal: true
class EventSerializer
  include ActiveModel::Serializers::JSON

  def initialize(event_id:)
    @event = Event.find(event_id)
  end

  def serializable_hash(_opts)
    event_hash
  end

  private

  def event_hash
    hash = {
      id: @event.id,
      start_at: @event.start_at,
      end_at: @event.end_at,
      title: @event.title,
      description: @event.description,
    }
    hash[:location] = {
      lat: @event.location[:lat],
      lng: @event.location[:lng]
    } unless @event.location.nil?
    hash
  end

end
