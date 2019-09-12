class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :link
      t.string :title
      t.string :description
      t.references :job_queue, foreign_key: true

      t.timestamps
    end
    add_column :job_queues, :page, :integer
    add_column :job_queues, :media_type, :string
  end
end
