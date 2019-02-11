require 'rails_helper'

RSpec.describe "admin/notifications/edit", type: :view do
  before(:each) do
    @admin_notification = assign(:admin_notification, Admin::Notification.create!(
      :text => "MyText"
    ))
  end

  it "renders the edit admin_notification form" do
    render

    assert_select "form[action=?][method=?]", admin_notification_path(@admin_notification), "post" do

      assert_select "textarea[name=?]", "admin_notification[text]"
    end
  end
end
