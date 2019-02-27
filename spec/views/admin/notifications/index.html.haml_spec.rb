# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/notifications/index', type: :view do
  before(:each) do
    assign(:admin_notifications, [
             Admin::Notification.create!(
               text: 'MyText'
             ),
             Admin::Notification.create!(
               text: 'MyText'
             )
           ])
  end

  it 'renders a list of admin/notifications' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
