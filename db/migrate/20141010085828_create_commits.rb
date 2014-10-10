class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :description
      t.string :author
      t.belongs_to :release

      t.timestamps
    end
  end
end
