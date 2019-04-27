module ApplicationHelper

  def avatar_url(user)
    return user.image if user.image.present?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end

  def full_title(page_title = '')
    base_title = "Instagram-clone"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
