# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/visit_to_visits/show', type: :view do
  before(:each) do
    @portal_visit_to_visit = assign(:portal_visit_to_visit, Portal::VisitToVisit.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
