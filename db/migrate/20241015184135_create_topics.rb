class CreateTopics < ActiveRecord::Migration[7.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :subject
      t.text :comment
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
