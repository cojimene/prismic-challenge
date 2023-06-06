class SimplePostsController < ApplicationController
  before_action :set_simple_post, only: :show

  # GET /simple_posts or /simple_posts.json
  def index
    @simple_posts = SimplePost.all
  end

  # GET /simple_posts/1 or /simple_posts/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_simple_post
    @simple_post = SimplePost.find(params[:id])
  end
end
