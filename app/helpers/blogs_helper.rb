module BlogsHelper
  def gravatar_helper(user)
    image_tag "https://api.adorable.io/avatars/35/abott@.io.png", style:'border-radius:50%';
  end
end

