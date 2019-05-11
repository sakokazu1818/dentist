require 'rails_helper'

RSpec.describe "Portal::TimeAndAccesses", type: :request do
  describe "GET /portal/time_and_accesses" do
    it "works! (now write some real specs)" do
      get portal_time_and_accesses_path
      expect(response).to have_http_status(200)
    end
  end
end
