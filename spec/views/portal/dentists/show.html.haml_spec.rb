# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/dentists/show', type: :view do
  before(:each) do
    @portal_dentist = assign(:portal_dentist, Portal::Dentist.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
