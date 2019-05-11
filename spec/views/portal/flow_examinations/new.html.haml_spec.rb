# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/flow_examinations/new', type: :view do
  before(:each) do
    assign(:portal_flow_examination, Portal::FlowExamination.new)
  end

  it 'renders new portal_flow_examination form' do
    render

    assert_select 'form[action=?][method=?]', portal_flow_examinations_path, 'post' do
    end
  end
end
