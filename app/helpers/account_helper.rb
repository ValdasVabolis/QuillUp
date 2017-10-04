module AccountHelper
  def avatar_image_tag(user)
    src = user.avatar? ? user.avatar : '/assets/avatar-default.jpg' 
    image_tag(src)    
  end
end