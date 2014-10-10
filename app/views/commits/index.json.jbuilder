json.array!(@commits) do |commit|
  json.extract! commit, :id, :sha, :author, :message, :is_pull_request
  json.url commit_url(commit, format: :json)
end
