require "rails_helper"

RSpec.describe Portal::RecruitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/recruits").to route_to("portal/recruits#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/recruits/new").to route_to("portal/recruits#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/recruits/1").to route_to("portal/recruits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/recruits/1/edit").to route_to("portal/recruits#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/recruits").to route_to("portal/recruits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/recruits/1").to route_to("portal/recruits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/recruits/1").to route_to("portal/recruits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/recruits/1").to route_to("portal/recruits#destroy", :id => "1")
    end
  end
end
