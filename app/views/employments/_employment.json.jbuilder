# frozen_string_literal: true

json.extract! employment, :id, :employer, :start_date, :emplyment_end_date, :created_at, :updated_at
json.url employment_url(employment, format: :json)
