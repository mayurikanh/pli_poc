# frozen_string_literal: true

class FixEmploymentDateEndColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :employments, :emplyment_date_end, :emplyment_end_date
  end
end
