require 'rails_helper'

RSpec.describe "Portal::VisitToVisits", type: :request do
  describe "GET /portal/visit_to_visits" do
    it "works! (now write some real specs)" do
      get portal_visit_to_visits_path
      expect(response).to have_http_status(200)
    end
  end
end
