# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin/notifications/new', type: :view do
  before(:each) do
    assign(:admin_notification, Admin::Notification.new(
                                  text: 'MyText'
                                ))
  end

  it 'renders new admin_notification form' do
    render

    assert_select 'form[action=?][method=?]', admin_notifications_path, 'post' do
      assert_select 'textarea[name=?]', 'admin_notification[text]'
    end
  end
end
