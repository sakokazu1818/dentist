json.extract! admin_notification, :id, :text, :created_at, :updated_at
json.url admin_notification_url(admin_notification, format: :json)
