require "rails_helper"

RSpec.describe Portal::TimeAndAccessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/time_and_accesses").to route_to("portal/time_and_accesses#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/time_and_accesses/new").to route_to("portal/time_and_accesses#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/time_and_accesses/1").to route_to("portal/time_and_accesses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/time_and_accesses/1/edit").to route_to("portal/time_and_accesses#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/time_and_accesses").to route_to("portal/time_and_accesses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/time_and_accesses/1").to route_to("portal/time_and_accesses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/time_and_accesses/1").to route_to("portal/time_and_accesses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/time_and_accesses/1").to route_to("portal/time_and_accesses#destroy", :id => "1")
    end
  end
end
