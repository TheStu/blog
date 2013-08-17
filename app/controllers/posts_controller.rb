class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  authorize_resource except: :section

  include PostCount # for unless bot? method in private

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:q]).map(&:id)
    @groups = Post.find(@posts).in_groups_of(2, false).paginate(page: params[:page], per_page: 4)

    respond_to do |format|
      format.html
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    impression_count(@post)
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.citations.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def section
    authorize! :read_section, :section
    @section = params[:section]
    @groups = Post.order('created_at DESC').where("section = ?", @section).in_groups_of(2, false).paginate(page: params[:page], per_page: 4)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :pic_thumbnail_url, :pic_large_url, :pic_large_square_url, :pic_medium_url, :flickr_url, :all_time_view_count, :monthly_view_count, :picture_alt_text, :section, :meta_description, :stars, :is_a_review, :last_upated_products_for_review, :pictures_attributes, citations_attributes: [:id, :url, :text], category_ids: [])
    end

    def impression_count(post)
      unless bot?(request.user_agent)
        post.update_attributes(monthly_view_count: post.monthly_view_count + 1,
                               all_time_view_count: post.all_time_view_count + 1)
      end
    end
end
