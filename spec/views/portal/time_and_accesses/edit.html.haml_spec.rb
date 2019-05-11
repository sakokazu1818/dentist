require 'rails_helper'

RSpec.describe "portal/time_and_accesses/edit", type: :view do
  before(:each) do
    @portal_time_and_access = assign(:portal_time_and_access, Portal::TimeAndAccess.create!())
  end

  it "renders the edit portal_time_and_access form" do
    render

    assert_select "form[action=?][method=?]", portal_time_and_access_path(@portal_time_and_access), "post" do
    end
  end
end
