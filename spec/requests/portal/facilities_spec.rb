# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Portal::Facilities', type: :request do
  describe 'GET /portal/facilities' do
    it 'works! (now write some real specs)' do
      get portal_facilities_path
      expect(response).to have_http_status(200)
    end
  end
end
