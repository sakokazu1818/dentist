# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Portal::Dentists', type: :request do
  describe 'GET /portal_dentists' do
    it 'works! (now write some real specs)' do
      get portal_dentists_path
      expect(response).to have_http_status(200)
    end
  end
end
