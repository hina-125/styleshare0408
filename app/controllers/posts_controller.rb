class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  # GET /posts or /posts.json
  def index
    @post = Post.all
  end

  # GET /posts/1 or /posts/1.json
  #def show
    #@post = Post.all
  #end
  
  # GET /posts/new
  def new
    @post = Post.new
  end
  
  # GET /posts/1/edit
  #def edit
    #@post = Post.find(params[:id])
  #end

  # POST /posts or /posts.json
  def create
    #post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = 'Image posted!'
      redirect_to root_url
    else
      #@posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'ERROR! Image cannot be posted'
      render :new
    end
    
    #respond_to do |format|
    #if @post.save
      #format.html { redirect_to @post, notice: "Post was successfully created." }
      #format.json { render :new, status: :created, location: @post }
    #else
      #format.html { render :new, status: :unprocessable_entity }
      #format.json { render json: @post.errors, status: :unprocessable_entity }
    #end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  #def update
    #respond_to do |format|
      #if @post.update(post_params)
        #format.html { redirect_to @post, notice: "Post was successfully updated." }
        #format.json { render :show, status: :ok, location: @post }
      #else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    #@post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Image deleted'
    redirect_back(fallback_location: root_path)
    #respond_to do |format|
      #format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      #format.json { head :no_content }
    #end
  end

  private

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :text, :image)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      unless @post
        redirect_to root_url
      end
    end

end
