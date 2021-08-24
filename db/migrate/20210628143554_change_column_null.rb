# frozen_string_literal: true

class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :surname, false)
  end
end
