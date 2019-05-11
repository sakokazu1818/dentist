require 'rails_helper'

RSpec.describe "portal/time_and_accesses/index", type: :view do
  before(:each) do
    assign(:portal_time_and_accesses, [
      Portal::TimeAndAccess.create!(),
      Portal::TimeAndAccess.create!()
    ])
  end

  it "renders a list of portal/time_and_accesses" do
    render
  end
end
