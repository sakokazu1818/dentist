require "rails_helper"

RSpec.describe Portal::DirectorIntroducingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/director_introducings").to route_to("portal/director_introducings#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/director_introducings/new").to route_to("portal/director_introducings#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/director_introducings/1").to route_to("portal/director_introducings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/director_introducings/1/edit").to route_to("portal/director_introducings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/director_introducings").to route_to("portal/director_introducings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/director_introducings/1").to route_to("portal/director_introducings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/director_introducings/1").to route_to("portal/director_introducings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/director_introducings/1").to route_to("portal/director_introducings#destroy", :id => "1")
    end
  end
end
