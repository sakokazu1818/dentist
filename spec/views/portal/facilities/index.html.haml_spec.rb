require 'rails_helper'

RSpec.describe "portal/facilities/index", type: :view do
  before(:each) do
    assign(:portal_facilities, [
      Portal::Facility.create!(),
      Portal::Facility.create!()
    ])
  end

  it "renders a list of portal/facilities" do
    render
  end
end
