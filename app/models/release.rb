class Release < ActiveRecord::Base
  has_many :commits

  def populate_commits
    puts 'Initing repo'
    repo = Rugged::Repository.new('/Users/tgandrews/froont/froont')
    puts 'Lookup remote'
    # puts repo.remotes['origin'].inspect
    # repo.remotes['origin'].fetch()
    puts 'Creating walker'
    i = 0
    repo.walk 'HEAD' do |c|
      if c.message.start_with? "Merge pull request"
        puts "Message: #{c.message}"
        puts "Author: #{c.author}"
        i += 1
        if i > 10
          return false
        end
      end
    end
  end
end
