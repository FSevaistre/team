# frozen_string_literal: true
module ValidateParams

  extend ActiveSupport::Concern

  # Raised when an endpoint is called with invalid parameters
  class InvalidParameters < StandardError
    def initialize(errors, message = nil)
      @message = message
      @errors = errors
    end

    attr_reader :errors

    def message
      @message || "Invalid parameters : #{errors}"
    end
  end

  included do
    rescue_from InvalidParameters do |e|
      Rails.logger.warn("ApplicationController::InvalidParameters errors=#{e.errors.to_h.to_json} params=#{params.to_json}")
      render_error(e.errors.to_h.merge(key: "invalid_parameters"))
    end
  end

  # Validates params on a dry schema, and return the result
  # Can be given a schema dynamically for runtime validations
  def validate_params(schema = nil, &block)
    schema ||= Dry::Validation.JSON(&block)
    res = schema.call(params.to_unsafe_h)
    fail(InvalidParameters, res.errors) if res.failure?
    res.to_h.deep_symbolize_keys
  end

  def render_error(error, status: 422)
    payload = error.is_a?(Hash) ? error : { key: error }
    fail "Missing mandatory key in error" unless payload.key?(:key)
    render json: { error: payload }, status: status
  end

end
