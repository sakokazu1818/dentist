# frozen_string_literal: true

class Portal::FlowExaminationsController < ApplicationController
  # GET /portal/flow_examinations
  # GET /portal/flow_examinations.json
  def index
    @portal_flow_examinations = []

    unless request.from_pc? || request.from_android_tablet? || request.from_ipad?
      set_contents_sp
      render :index_smart_phone, layout: 'smart_phone.html.haml'
    else
      set_contents
      return
    end
  end
end
