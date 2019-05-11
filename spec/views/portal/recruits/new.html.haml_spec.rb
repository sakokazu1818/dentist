require 'rails_helper'

RSpec.describe "portal/recruits/new", type: :view do
  before(:each) do
    assign(:portal_recruit, Portal::Recruit.new())
  end

  it "renders new portal_recruit form" do
    render

    assert_select "form[action=?][method=?]", portal_recruits_path, "post" do
    end
  end
end
