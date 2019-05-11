# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/abouts/edit', type: :view do
  before(:each) do
    @portal_about = assign(:portal_about, Portal::About.create!)
  end

  it 'renders the edit portal_about form' do
    render

    assert_select 'form[action=?][method=?]', portal_about_path(@portal_about), 'post' do
    end
  end
end
