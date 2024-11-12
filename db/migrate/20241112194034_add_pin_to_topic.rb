class AddPinToTopic < ActiveRecord::Migration[7.2]
  def change
    add_column :topics, :pin, :boolean
  end
end
