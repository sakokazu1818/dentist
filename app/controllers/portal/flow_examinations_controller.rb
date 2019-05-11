class Portal::FlowExaminationsController < ApplicationController
  # GET /portal/flow_examinations
  # GET /portal/flow_examinations.json
  def index
    @portal_flow_examinations = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml'
    end
  end
end
