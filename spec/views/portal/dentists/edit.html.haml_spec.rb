# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/dentists/edit', type: :view do
  before(:each) do
    @portal_dentist = assign(:portal_dentist, Portal::Dentist.create!)
  end

  it 'renders the edit portal_dentist form' do
    render

    assert_select 'form[action=?][method=?]', portal_dentist_path(@portal_dentist), 'post' do
    end
  end
end
