FactoryBot.define do
  factory :admin_notification, class: 'Admin::Notification' do
    text { "MyText" }
  end
end
