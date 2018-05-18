class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_sidebar_topics, except: [:create, :update, :destroy, :toggle_status ]

  layout 'blog'
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update, :toggle_status]}, site_admin: :all

  def index
    @blogs = Blog.recent_posts.page(params[:page]).per(4)
    @page_title = "Sergio Alves Blog"
  end

  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])
      @comment = Comment.new
      @page_title = @blog.title
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice: 'You are not authorised to access this page'
    end
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'Blog was successfully destroyed.'
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
      redirect_to blogs_path, notice: "Blog was successfully published"
    elsif @blog.published?
      @blog.draft!
      redirect_to blogs_path, notice: "Blog is now on draft!"
    end
  end

  private

    def set_sidebar_topics
      @topics_sidebar = Topic.with_blogs
    end

    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id, :status)
    end
end
