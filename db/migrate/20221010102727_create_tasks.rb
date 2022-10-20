# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.references :project, null: false, foreign_key: true
      t.string :status, null: false, default: 'ToDo'

      t.timestamps
    end
  end
end
