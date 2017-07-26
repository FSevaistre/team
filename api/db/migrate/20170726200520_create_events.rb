# frozen_string_literal: true
class CreateEvents < ActiveRecord::Migration[5.1]

  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.text :description
      t.jsonb :location
      t.timestamps
    end
  end

end
