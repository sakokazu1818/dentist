require 'rails_helper'

RSpec.describe "portal/facilities/edit", type: :view do
  before(:each) do
    @portal_facility = assign(:portal_facility, Portal::Facility.create!())
  end

  it "renders the edit portal_facility form" do
    render

    assert_select "form[action=?][method=?]", portal_facility_path(@portal_facility), "post" do
    end
  end
end
