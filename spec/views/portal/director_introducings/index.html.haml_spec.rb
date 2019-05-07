require 'rails_helper'

RSpec.describe "portal/director_introducings/index", type: :view do
  before(:each) do
    assign(:portal_director_introducings, [
      Portal::DirectorIntroducing.create!(),
      Portal::DirectorIntroducing.create!()
    ])
  end

  it "renders a list of portal/director_introducings" do
    render
  end
end
