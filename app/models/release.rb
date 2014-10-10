class Release < ActiveRecord::Base
  has_many :commits, :inverse_of => :release
  after_initialize :after_initialize

  def pull_request_commits
    self.commits.where(:is_pull_request => true)
  end

  def populate_commits
    return unless previous_commit

    previous_sha = previous_commit.sha

    puts 'Initing repo'
    repo = Rugged::Repository.new('/Users/tgandrews/froont/froont')
    puts 'Creating walker'
    repo.walk 'HEAD' do |c|
      is_pull_request = false
      if c.message.start_with? "Merge pull request"
          is_pull_request = true
      end
      commit = Commit.new(description: c.message, author: c.author[:name], sha: c.oid, is_pull_request: is_pull_request)
      self.commits << commit

      if c.oid == previous_sha
        return false
      end
    end
  end

  private

  def previous_commit
    Release.order('id desc').first
  end

  def after_initialize
    self.release_date ||= Time.new
  end
end
