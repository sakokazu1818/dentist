require "rails_helper"

RSpec.describe Portal::VisitToVisitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/visit_to_visits").to route_to("portal/visit_to_visits#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/visit_to_visits/new").to route_to("portal/visit_to_visits#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/visit_to_visits/1").to route_to("portal/visit_to_visits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/visit_to_visits/1/edit").to route_to("portal/visit_to_visits#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/visit_to_visits").to route_to("portal/visit_to_visits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/visit_to_visits/1").to route_to("portal/visit_to_visits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/visit_to_visits/1").to route_to("portal/visit_to_visits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/visit_to_visits/1").to route_to("portal/visit_to_visits#destroy", :id => "1")
    end
  end
end
