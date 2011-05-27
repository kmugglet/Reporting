class CreateVLatestMilestoneDates < ActiveRecord::Migration
  def self.up
    create_table :v_latest_milestone_dates do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :v_latest_milestone_dates
  end
end
