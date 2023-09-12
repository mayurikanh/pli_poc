# frozen_string_literal: true

class Personal < ApplicationRecord
  has_many :employments, dependent: :destroy
  accepts_nested_attributes_for :employments, allow_destroy: true, reject_if: :all_blank
  validates_presence_of :first_name, :last_name, :email_address
  validates :first_name, length: { maximum: 25 }
  validates :last_name, length: { maximum: 50 }
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true,
                           format: { with: /\d{3}-\d{3}-\d{4}/, message: 'format should be xxx-xxx-xxxx.' }
end
