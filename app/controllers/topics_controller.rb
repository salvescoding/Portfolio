class TopicsController < ApplicationController
  layout 'blog'
  before_action :set_topic, only: [:show]
  before_action :set_sidebar_topics, except: [:create]

  def index
    @topics = Topic.all
  end

  def show
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent_posts.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent_posts.page(params[:page]).per(5)
    end
  end

  def create
    @topic = Topic.create!(topic_params)
  end

  private

  def set_sidebar_topics
    @topics_sidebar = Topic.with_blogs
  end

  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
