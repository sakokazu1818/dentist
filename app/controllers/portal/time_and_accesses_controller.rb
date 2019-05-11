# frozen_string_literal: true

class Portal::TimeAndAccessesController < ApplicationController
  # GET /portal/time_and_accesses
  # GET /portal/time_and_accesses.json
  def index
    @portal_time_and_accesses = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml'
    end
  end
end
