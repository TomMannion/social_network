require 'post'

class PostRepository
    def all
        query = 'SELECT * FROM posts;'
        posts = []
        result = DatabaseConnection.exec_params(query, [])
        result.each do |post|
            new_post = Post.new
            new_post.id = post['id']
            new_post.title = post['title']
            new_post.content = post['content']
            new_post.views = post['views']
            new_post.account_id = post['account_id']
            posts << new_post
        end
        posts
    end

    def find(id)
      query = 'SELECT * FROM posts WHERE id = $1;'
      result = DatabaseConnection.exec_params(query, [id])
      result = result.first
      post = Post.new
      post.id = result['id']
      post.title = result['title']
      post.content = result['content']
      post.views = result['views']
      post.account_id = result['account_id']
      post
    end

    def create(post)
        query = 'INSERT INTO posts (title, content, views, account_id) VALUES($1, $2, $3, $4);'
        params = [post.title, post.content, post.views, post.account_id]
        result = DatabaseConnection.exec_params(query, params)
    end


    def delete(id)
      query = "DELETE FROM posts WHERE id = $1;"
      DatabaseConnection.exec_params(query, [id])
    end
end