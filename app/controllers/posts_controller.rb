class PostsController < ApplicationController
  def index
    posts = [1, 2, 3].map{|n| Post.new(id: n, title: "sample_title#{n}", body: "sample_body#{n}") }
    # render json: { posts: Post.all.select(:id, :title, :body) }
    render json: posts.to_json(only: [:id, :title, :body])
  end
end
