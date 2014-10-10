class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.string :sha
      t.string :author
      t.string :message
      t.boolean :is_pull_request

      t.timestamps
    end
  end
end
