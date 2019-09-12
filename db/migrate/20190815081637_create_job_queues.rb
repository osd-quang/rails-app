class CreateJobQueues < ActiveRecord::Migration[5.2]
  def change
    create_table :job_queues do |t|
      t.boolean :status
      t.string :query_key

      t.timestamps
    end
    remove_column :users, :posts, :posts
  end
end
