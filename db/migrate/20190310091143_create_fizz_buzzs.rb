# frozen_string_literal: true

class CreateFizzBuzzs < ActiveRecord::Migration[5.2]
  def change
    create_table :fizz_buzzs do |t|
      t.integer :number, null: false

      t.timestamps
    end
  end
end
