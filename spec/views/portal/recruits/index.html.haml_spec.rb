require 'rails_helper'

RSpec.describe "portal/recruits/index", type: :view do
  before(:each) do
    assign(:portal_recruits, [
      Portal::Recruit.create!(),
      Portal::Recruit.create!()
    ])
  end

  it "renders a list of portal/recruits" do
    render
  end
end
