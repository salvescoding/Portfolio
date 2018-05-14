module BlogsHelper
  def gravatar_helper(user)
    image_tag "https://api.adorable.io/avatars/35/abott@.io.png", style:'border-radius:50%';
  end

  def topic_generator
    topics = ''
    Topic.all.limit(4).each do |topic|
      topics << "<a href='#{topic_path(topic)}'><p>#{topic.title}</p></a>"
    end
    topics.html_safe
  end
end

