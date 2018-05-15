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

  def icon_trash_helper(blog)
    link_to blog, method: :delete, data: { confirm: 'Are you sure?' } do
      fa_icon 'trash 2x'
     end
  end

  def icon_edit_helper(blog)
    link_to edit_blog_path(blog) do
      fa_icon 'edit 2x'
    end
  end

  def icon_status_helper(blog)
    link_to toggle_status_blog_path(blog) do
      if blog.published?
        fa_icon 'check 2x'
      else
        fa_icon 'user-secret 2x'
      end
    end
  end

  def pusblished_blogs_helper
    @blogs.published
  end


  def blogs_index_helper
    logged_in?(:site_admin) ? @blogs : pusblished_blogs_helper
  end
end

