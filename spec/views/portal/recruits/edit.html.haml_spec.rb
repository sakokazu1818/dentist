require 'rails_helper'

RSpec.describe "portal/recruits/edit", type: :view do
  before(:each) do
    @portal_recruit = assign(:portal_recruit, Portal::Recruit.create!())
  end

  it "renders the edit portal_recruit form" do
    render

    assert_select "form[action=?][method=?]", portal_recruit_path(@portal_recruit), "post" do
    end
  end
end
