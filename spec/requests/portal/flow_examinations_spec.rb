# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Portal::FlowExaminations', type: :request do
  describe 'GET /portal/flow_examinations' do
    it 'works! (now write some real specs)' do
      get portal_flow_examinations_path
      expect(response).to have_http_status(200)
    end
  end
end
