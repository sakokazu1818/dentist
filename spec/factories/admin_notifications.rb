# frozen_string_literal: true

FactoryBot.define do
  factory :admin_notification, class: 'Admin::Notification' do
    text { 'MyText' }
  end
end
