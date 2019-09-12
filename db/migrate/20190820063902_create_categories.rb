class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    enable_extension "uuid-ossp"
    enable_extension "pgcrypto"
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
