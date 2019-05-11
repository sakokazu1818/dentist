require "rails_helper"

RSpec.describe Portal::FlowExaminationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/portal/flow_examinations").to route_to("portal/flow_examinations#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/flow_examinations/new").to route_to("portal/flow_examinations#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/flow_examinations/1").to route_to("portal/flow_examinations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/flow_examinations/1/edit").to route_to("portal/flow_examinations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/portal/flow_examinations").to route_to("portal/flow_examinations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/flow_examinations/1").to route_to("portal/flow_examinations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/flow_examinations/1").to route_to("portal/flow_examinations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/flow_examinations/1").to route_to("portal/flow_examinations#destroy", :id => "1")
    end
  end
end
