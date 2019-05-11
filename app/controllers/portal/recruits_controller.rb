class Portal::RecruitsController < ApplicationController
  # GET /portal/recruits
  # GET /portal/recruits.json
  def index
    @portal_recruits = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml'
    end
  end
end
