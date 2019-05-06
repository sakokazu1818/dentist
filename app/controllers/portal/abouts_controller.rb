class Portal::AboutsController < ApplicationController

  # GET /portal/abouts
  # GET /portal/abouts.json
  def index
    @portal_abouts = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml' 
    end
  end
end
