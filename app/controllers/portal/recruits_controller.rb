# frozen_string_literal: true

class Portal::RecruitsController < ApplicationController
  # GET /portal/recruits
  # GET /portal/recruits.json
  def index
    @portal_recruits = []

    unless request.from_pc? || request.from_android_tablet? || request.from_ipad?
      set_contents_sp
      render :index_smart_phone, layout: 'smart_phone.html.haml'
    else
      set_contents
      return
    end
  end
end
