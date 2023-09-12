# frozen_string_literal: true

class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.string :employer
      t.date :start_date
      t.date :emplyment_date_end
      t.references :personal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
