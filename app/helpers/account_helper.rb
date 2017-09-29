module AccountHelper

  def avatar_image_tag(user)
    src = user.avatar.nil? ? image_path('avatar-default.jpg') : user.avatar
    image_tag(src)
  end
  
end