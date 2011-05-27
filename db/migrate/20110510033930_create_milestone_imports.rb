class CreateMilestoneImports < ActiveRecord::Migration
  def self.up
    create_table :milestone_imports do |t|
      t.integer :node_id
      t.integer :milestone_id
      t.text :pfa
      t.text :filename

      t.timestamps
    end
  end

  def self.down
    drop_table :milestone_imports
  end
end
