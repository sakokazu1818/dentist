# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/abouts/new', type: :view do
  before(:each) do
    assign(:portal_about, Portal::About.new)
  end

  it 'renders new portal_about form' do
    render

    assert_select 'form[action=?][method=?]', portal_abouts_path, 'post' do
    end
  end
end
