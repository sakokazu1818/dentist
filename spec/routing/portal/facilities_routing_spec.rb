require "rails_helper"

RSpec.describe Portal::FacilitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/facilities").to route_to("portal/facilities#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/facilities/new").to route_to("portal/facilities#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/facilities/1").to route_to("portal/facilities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/facilities/1/edit").to route_to("portal/facilities#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/facilities").to route_to("portal/facilities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/facilities/1").to route_to("portal/facilities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/facilities/1").to route_to("portal/facilities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/facilities/1").to route_to("portal/facilities#destroy", :id => "1")
    end
  end
end
