# frozen_string_literal: true

class Portal::DirectorIntroducingsController < ApplicationController
  # GET /portal/director_introducings
  # GET /portal/director_introducings.json
  def index
    @portal_director_introducings = []

    unless request.from_pc? || request.from_android_tablet? || request.from_ipad?
      set_contents_sp
      render :index_smart_phone, layout: 'smart_phone.html.haml'
    else
      set_contents
      return
    end
  end
end
