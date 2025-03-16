# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @google_maps_guapulo_url = 'https://maps.app.goo.gl/DTiD1FDRUUtRwWHBA'
    @google_maps_alcazar_url = 'https://maps.app.goo.gl/C5CQ6MW2hFktH5wA7'
  end
end
