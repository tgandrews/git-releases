class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :sha
      t.datetime :release_date

      t.timestamps
    end
  end
end
