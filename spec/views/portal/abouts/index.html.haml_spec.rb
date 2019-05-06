require 'rails_helper'

RSpec.describe "portal/abouts/index", type: :view do
  before(:each) do
    assign(:portal_abouts, [
      Portal::About.create!(),
      Portal::About.create!()
    ])
  end

  it "renders a list of portal/abouts" do
    render
  end
end
