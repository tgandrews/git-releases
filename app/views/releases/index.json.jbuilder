json.array!(@releases) do |release|
  json.extract! release, :id, :sha, :release_date
  json.url release_url(release, format: :json)
end
