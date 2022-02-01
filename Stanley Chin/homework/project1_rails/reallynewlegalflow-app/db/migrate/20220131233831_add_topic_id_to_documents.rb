class AddTopicIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :topic_id, :integer
  end
end
