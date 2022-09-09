require 'account_repository'
require 'database_connection'
require 'account'


def reset_accounts_table
  seed_sql = File.read("account_seeds.sql")
  connection = PG.connect({host: '127.0.0.1', dbname: 'social_network'})
  connection.exec(seed_sql)
end

def reset_posts_table
    seed_sql = File.read("posts_seeds.sql")
    connection = PG.connect({host: '127.0.0.1', dbname: 'social_network'})
    connection.exec(seed_sql)
end

RSpec.describe AccountRepository do
    before(:each) do
        reset_accounts_table
        reset_posts_table
    end

    it 'constructs' do
        repo = AccountRepository.new
        accounts = repo.all
        expect(accounts.length).to eq 6
    end

    it "finds an account with an id parameter" do
        repo = AccountRepository.new
        account = repo.find(1)
        expect(account.username).to eq 'thomasmannion'
    end

    it "should create and account" do
      repo = AccountRepository.new
      account = Account.new
      account.username = 'Jimothy'
      account.email = 'Jimothy@yahoo.com'
      repo.create(account)
      accounts = repo.all
      expect(accounts.length).to eq 7
      expect(accounts.last.username).to eq 'Jimothy'
    end

    it 'deletes based on id' do
        repo = AccountRepository.new
        repo.delete(1)
        accounts = repo.all
        expect(accounts.length).to eq 5
        expect(accounts.first.username).to eq 'jasonboylan'
    end
end