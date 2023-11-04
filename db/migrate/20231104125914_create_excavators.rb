# frozen_string_literal: true

class CreateExcavators < ActiveRecord::Migration[7.1]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.text :address
      t.boolean :crew_onsite
      t.references :ticket, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
