json.array!(@commits) do |commit|
  json.extract! commit, :id, :id, :sha, :description, :author, :release_id
  json.url commit_url(commit, format: :json)
end
