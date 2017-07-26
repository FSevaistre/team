# frozen_string_literal: true
class ApplicationController < ActionController::API

  include ValidateParams

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error("not found", status: 404)
  end

end
