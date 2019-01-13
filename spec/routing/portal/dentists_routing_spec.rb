require "rails_helper"

RSpec.describe Portal::DentistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/dentists").to route_to("portal/dentists#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/dentists/new").to route_to("portal/dentists#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/dentists/1").to route_to("portal/dentists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/dentists/1/edit").to route_to("portal/dentists#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/dentists").to route_to("portal/dentists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/dentists/1").to route_to("portal/dentists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/dentists/1").to route_to("portal/dentists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/dentists/1").to route_to("portal/dentists#destroy", :id => "1")
    end
  end
end
