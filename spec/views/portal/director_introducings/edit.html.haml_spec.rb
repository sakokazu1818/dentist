require 'rails_helper'

RSpec.describe "portal/director_introducings/edit", type: :view do
  before(:each) do
    @portal_director_introducing = assign(:portal_director_introducing, Portal::DirectorIntroducing.create!())
  end

  it "renders the edit portal_director_introducing form" do
    render

    assert_select "form[action=?][method=?]", portal_director_introducing_path(@portal_director_introducing), "post" do
    end
  end
end
