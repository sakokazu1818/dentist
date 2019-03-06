# frozen_string_literal: true

class AdminUser < ApplicationRecord
  has_secure_password

  validates :name, :password_digest, presence: true
  validates :name, uniqueness: true
end
