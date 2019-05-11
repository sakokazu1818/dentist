require 'rails_helper'

RSpec.describe "portal/visit_to_visits/new", type: :view do
  before(:each) do
    assign(:portal_visit_to_visit, Portal::VisitToVisit.new())
  end

  it "renders new portal_visit_to_visit form" do
    render

    assert_select "form[action=?][method=?]", portal_visit_to_visits_path, "post" do
    end
  end
end
