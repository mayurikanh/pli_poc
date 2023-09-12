# frozen_string_literal: true

json.extract! personal, :id, :first_name, :last_name, :nickname, :email_address, :phone_number, :created_at, :updated_at
json.url personal_url(personal, format: :json)
