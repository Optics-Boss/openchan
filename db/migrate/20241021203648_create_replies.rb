class CreateReplies < ActiveRecord::Migration[7.2]
  def change
    create_table :replies do |t|
      t.string :name
      t.text :comment
      t.belongs_to :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
