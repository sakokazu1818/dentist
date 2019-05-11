# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/visit_to_visits/edit', type: :view do
  before(:each) do
    @portal_visit_to_visit = assign(:portal_visit_to_visit, Portal::VisitToVisit.create!)
  end

  it 'renders the edit portal_visit_to_visit form' do
    render

    assert_select 'form[action=?][method=?]', portal_visit_to_visit_path(@portal_visit_to_visit), 'post' do
    end
  end
end
