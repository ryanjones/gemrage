module ProfilesHelper
  def gravatar(user, size = 150)
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.strip.downcase)}.png?s=#{size}", :alt => "Gravatar for #{user.handle}", :class => 'gravatar')
  end
end
