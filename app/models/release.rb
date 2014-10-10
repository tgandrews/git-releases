class Release < ActiveRecord::Base
  has_many :commits
end
