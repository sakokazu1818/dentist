require 'rails_helper'

RSpec.describe "portal/abouts/show", type: :view do
  before(:each) do
    @portal_about = assign(:portal_about, Portal::About.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
