class Portal::VisitToVisitsController < ApplicationController
  # GET /portal/visit_to_visits
  # GET /portal/visit_to_visits.json
  def index
    @portal_visit_to_visits = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml'
    end
  end
end
