# frozen_string_literal: true

class Portal::FacilitiesController < ApplicationController
  # GET /portal/facilities
  # GET /portal/facilities.json
  def index
    @portal_facilities = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml'
    end
  end
end
