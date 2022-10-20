# frozen_string_literal: true

class CreateCorporations < ActiveRecord::Migration[7.0]
  def change
    create_table :corporations do |t|
      t.string :name, null: false
      t.string :status, null: false, default: 'reviewed'

      t.timestamps
    end
  end
end
