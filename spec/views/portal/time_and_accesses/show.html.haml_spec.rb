# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/time_and_accesses/show', type: :view do
  before(:each) do
    @portal_time_and_access = assign(:portal_time_and_access, Portal::TimeAndAccess.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
