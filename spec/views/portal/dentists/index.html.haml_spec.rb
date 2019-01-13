require 'rails_helper'

RSpec.describe "portal/dentists/index", type: :view do
  before(:each) do
    assign(:portal_dentists, [
      Portal::Dentist.create!(),
      Portal::Dentist.create!()
    ])
  end

  it "renders a list of portal/dentists" do
    render
  end
end
