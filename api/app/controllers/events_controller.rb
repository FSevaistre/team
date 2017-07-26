# frozen_string_literal: true
class LoansController < ApplicationController

  SCHEMA = Dry::Validation.JSON do
    required(:start_at).value(:date_time?)
    required(:title).value(:str?)

    optional(:description).value(:str?)
    optional(:location).schema(
      Dry::Validation.JSON do
        required(:lat).value(:number?)
        required(:lng).value(:number?)
      end
    )
    optional(:end_at).value(:date_time?)
  end

  # GET /api/v0/events
  def index
  end

  # GET /api/v0/events/:id
  def show
    render json: EventSerializer.new(event_id: params[:id])
  end

  # POST /api/v0/events
  def create
    event = Event.new(event_params)
    event.save!
    render json: EventSerializer.new(event_id: event.id)
  end

  # PUT /api/v0/events/:id
  def update
    event.update!(event_params)
    render json: EventSerializer.new(event_id: event.id)
  end

  # DELETE /api/v0/events/:id
  def destroy
  end

  private

  def loan
    @_event ||= Event.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    validate_params(SCHEMA)
  end

end
