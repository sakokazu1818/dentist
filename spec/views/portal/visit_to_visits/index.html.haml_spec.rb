require 'rails_helper'

RSpec.describe "portal/visit_to_visits/index", type: :view do
  before(:each) do
    assign(:portal_visit_to_visits, [
      Portal::VisitToVisit.create!(),
      Portal::VisitToVisit.create!()
    ])
  end

  it "renders a list of portal/visit_to_visits" do
    render
  end
end
