class PostsController < ::ApplicationController
  before_action :authenticate_user!

  def index
    render json: Post.all.to_json(only: [:id, :title, :body])
  end
  
  def show
    return render :json, status: :not_found if post.blank?

    render json: Post.find_by(id: params[:id])
  end

  def create
    post = Post.new(post_params)
    if post.valid?
      post.save!
      return render :json, status: :created
    end
  
    render json: post.errors.details.to_json, status: :bad_request
  end

  def destroy    
    post = Post.find_by(id: params[:id])
    return render :json, status: :not_found if post.blank?

    post.destroy!
    render :json, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(:name, :title)
  end
end
