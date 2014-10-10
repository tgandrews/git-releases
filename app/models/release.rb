class Release < ActiveRecord::Base
  has_many :commits, :inverse_of => :release

  def populate_commits
    previous_sha = previous_commit.sha

    puts 'Initing repo'
    repo = Rugged::Repository.new('/Users/tgandrews/froont/froont')
    puts 'Creating walker'
    i = 0
    repo.walk 'HEAD' do |c|
      if c.message.start_with? "Merge pull request"
        commit = Commit.new(description: c.message, author: c.author[:name])
        self.commits << commit
        if c.tree.oid == previous_sha
          return false
        end
      end
    end
  end

  def previous_commit
    Release.order('id desc').first
  end
end
