require 'rails_helper'

RSpec.describe "Portal::Abouts", type: :request do
  describe "GET /portal/abouts" do
    it "works! (now write some real specs)" do
      get portal_abouts_path
      expect(response).to have_http_status(200)
    end
  end
end
