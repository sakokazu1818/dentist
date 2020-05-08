# frozen_string_literal: true

class Portal::VisitToVisitsController < ApplicationController
  # GET /portal/visit_to_visits
  # GET /portal/visit_to_visits.json
  def index
    @portal_visit_to_visits = []

    unless request.from_pc? || request.from_android_tablet? || request.from_ipad?
      set_contents_sp
      render :index_smart_phone, layout: 'smart_phone.html.haml'
    else
      set_contents
      return
    end
  end
end
