class CreateModels < ActiveRecord::Migration[7.2]
  def change
    create_table :models do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
