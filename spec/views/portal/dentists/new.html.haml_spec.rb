require 'rails_helper'

RSpec.describe "portal/dentists/new", type: :view do
  before(:each) do
    assign(:portal_dentist, Portal::Dentist.new())
  end

  it "renders new portal_dentist form" do
    render

    assert_select "form[action=?][method=?]", portal_dentists_path, "post" do
    end
  end
end
