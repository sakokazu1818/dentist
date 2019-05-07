require 'rails_helper'

RSpec.describe "Portal::DirectorIntroducings", type: :request do
  describe "GET /portal/director_introducings" do
    it "works! (now write some real specs)" do
      get portal_director_introducings_path
      expect(response).to have_http_status(200)
    end
  end
end
