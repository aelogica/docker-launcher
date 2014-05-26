class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.integer :project_id
      t.string :description

      t.timestamps
    end
  end
end
