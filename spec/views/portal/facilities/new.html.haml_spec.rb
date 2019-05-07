require 'rails_helper'

RSpec.describe "portal/facilities/new", type: :view do
  before(:each) do
    assign(:portal_facility, Portal::Facility.new())
  end

  it "renders new portal_facility form" do
    render

    assert_select "form[action=?][method=?]", portal_facilities_path, "post" do
    end
  end
end
