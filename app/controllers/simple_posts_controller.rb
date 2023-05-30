class SimplePostsController < ApplicationController
  before_action :set_simple_post, only: %i[ show edit update destroy ]

  # GET /simple_posts or /simple_posts.json
  def index
    @simple_posts = SimplePost.all
  end

  # GET /simple_posts/1 or /simple_posts/1.json
  def show
  end

  # GET /simple_posts/new
  def new
    @simple_post = SimplePost.new
  end

  # GET /simple_posts/1/edit
  def edit
  end

  # POST /simple_posts or /simple_posts.json
  def create
    @simple_post = SimplePost.new(simple_post_params)

    respond_to do |format|
      if @simple_post.save
        format.html { redirect_to simple_post_url(@simple_post), notice: "Simple post was successfully created." }
        format.json { render :show, status: :created, location: @simple_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @simple_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simple_posts/1 or /simple_posts/1.json
  def update
    respond_to do |format|
      if @simple_post.update(simple_post_params)
        format.html { redirect_to simple_post_url(@simple_post), notice: "Simple post was successfully updated." }
        format.json { render :show, status: :ok, location: @simple_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @simple_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simple_posts/1 or /simple_posts/1.json
  def destroy
    @simple_post.destroy

    respond_to do |format|
      format.html { redirect_to simple_posts_url, notice: "Simple post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_post
      @simple_post = SimplePost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def simple_post_params
      params.require(:simple_post).permit(:prismic_id, :title, :image_url, :content)
    end
end
