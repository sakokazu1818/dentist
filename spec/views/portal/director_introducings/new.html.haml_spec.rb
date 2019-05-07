require 'rails_helper'

RSpec.describe "portal/director_introducings/new", type: :view do
  before(:each) do
    assign(:portal_director_introducing, Portal::DirectorIntroducing.new())
  end

  it "renders new portal_director_introducing form" do
    render

    assert_select "form[action=?][method=?]", portal_director_introducings_path, "post" do
    end
  end
end
