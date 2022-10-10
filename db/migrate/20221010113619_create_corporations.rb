# frozen_string_literal: true

class CreateCorporations < ActiveRecord::Migration[7.0]
  def change
    create_table :corporations do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
