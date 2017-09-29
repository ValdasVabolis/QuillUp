class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w[jpg jpeg gif png bmp webp]
  end
end
