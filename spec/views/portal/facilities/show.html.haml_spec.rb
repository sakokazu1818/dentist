require 'rails_helper'

RSpec.describe "portal/facilities/show", type: :view do
  before(:each) do
    @portal_facility = assign(:portal_facility, Portal::Facility.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
