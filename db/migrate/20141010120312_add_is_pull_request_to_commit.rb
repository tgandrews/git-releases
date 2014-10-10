class AddIsPullRequestToCommit < ActiveRecord::Migration
  def change
    add_column :commits, :is_pull_request, :boolean
  end
end
