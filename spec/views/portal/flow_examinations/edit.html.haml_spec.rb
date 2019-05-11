require 'rails_helper'

RSpec.describe "portal/flow_examinations/edit", type: :view do
  before(:each) do
    @portal_flow_examination = assign(:portal_flow_examination, Portal::FlowExamination.create!())
  end

  it "renders the edit portal_flow_examination form" do
    render

    assert_select "form[action=?][method=?]", portal_flow_examination_path(@portal_flow_examination), "post" do
    end
  end
end
