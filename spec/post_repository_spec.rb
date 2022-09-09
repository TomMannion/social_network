require 'post_repository'
require 'database_connection'
require 'post'

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

RSpec.describe PostRepository do
    before(:each) do
        reset_accounts_table
        reset_posts_table
    end

    it 'constructs' do
      repo = PostRepository.new
      posts = repo.all
      expect(posts.length).to eq 9
    end

    it "finds a post based on id" do
        repo = PostRepository.new
        post = repo.find(1)
        expect(post.title).to eq 'boring day'
    end
    
    it 'creates a post' do
        repo = PostRepository.new
        new_post = Post.new
        new_post.title = 'another day'
        new_post.content = 'yet another day at the shops lol'
        new_post.views = 45000
        new_post.account_id = 2
        repo.create(new_post)
        posts = repo.all
        expect(posts.length).to eq 10
        expect(posts.last.title).to eq 'another day'
    end
        
    it "should delete a post by id" do
      repo = PostRepository.new
      repo.delete(1)
      result = repo.all
      expect(result.length).to eq 8
      expect(result.first.title).to eq 'great day'
    end
end