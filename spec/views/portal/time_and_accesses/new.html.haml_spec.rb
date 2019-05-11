require 'rails_helper'

RSpec.describe "portal/time_and_accesses/new", type: :view do
  before(:each) do
    assign(:portal_time_and_access, Portal::TimeAndAccess.new())
  end

  it "renders new portal_time_and_access form" do
    render

    assert_select "form[action=?][method=?]", portal_time_and_accesses_path, "post" do
    end
  end
end
