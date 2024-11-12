class AddReportedToReplies < ActiveRecord::Migration[7.2]
  def change
    add_column :replies, :reported, :boolean
  end
end
