# frozen_string_literal: true

class Portal::DirectorIntroducingsController < ApplicationController
  # GET /portal/director_introducings
  # GET /portal/director_introducings.json
  def index
    @portal_director_introducings = []

    if request.smart_phone?
      set_contents_sp

      render :index_smart_phone, layout: 'smart_phone.html.haml'
    end
  end
end
