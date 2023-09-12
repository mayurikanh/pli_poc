# frozen_string_literal: true

class Employment < ApplicationRecord
  belongs_to :personal
  validates_presence_of :employer
  validates :start_date, :emplyment_end_date, presence: true
end
