# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @google_maps_url = 'https://maps.app.goo.gl/C5CQ6MW2hFktH5wA7'
  end
end
