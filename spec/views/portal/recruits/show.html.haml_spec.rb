require 'rails_helper'

RSpec.describe "portal/recruits/show", type: :view do
  before(:each) do
    @portal_recruit = assign(:portal_recruit, Portal::Recruit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
