# frozen_string_literal: true

class AddClicksToUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :clicks, :integer
  end
end
