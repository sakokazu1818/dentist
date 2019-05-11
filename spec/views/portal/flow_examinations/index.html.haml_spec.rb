require 'rails_helper'

RSpec.describe "portal/flow_examinations/index", type: :view do
  before(:each) do
    assign(:portal_flow_examinations, [
      Portal::FlowExamination.create!(),
      Portal::FlowExamination.create!()
    ])
  end

  it "renders a list of portal/flow_examinations" do
    render
  end
end
