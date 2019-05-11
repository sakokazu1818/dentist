require 'rails_helper'

RSpec.describe "portal/flow_examinations/show", type: :view do
  before(:each) do
    @portal_flow_examination = assign(:portal_flow_examination, Portal::FlowExamination.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
