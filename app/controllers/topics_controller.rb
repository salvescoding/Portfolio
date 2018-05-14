class TopicsController < ApplicationController
  layout 'blog'
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.all
  end

  def show

  end

  def create
    @topic = Topic.create!(topic_params)
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
