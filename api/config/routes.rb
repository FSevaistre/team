# frozen_string_literal: true
Rails.application.routes.draw do

  scope "/api" do
    scope "/v0" do

      resources :event

    end
  end

end
