# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  #storage :file
  #storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  if Rails.env.production?

    def store_dir
      "avatar"
    end

  else

    def store_dir
      "test_taolinggan_avatar"
    end

  end


    def default_url
      "/avatar/fallback/"+[version_name, "avatar.png"].compact.join('_')
    end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  version :small do
    process :resize_to_fill => [16, 16]
  end

  version :normal do
    process :resize_to_fill => [48, 48]
  end

  version :big do
    process :resize_to_fill => [64, 64]
  end

  version :large do
    process :resize_to_fill => [120, 120]
  end

  def filename
    if super.present?
      "avatar/#{model.id}.#{file.extension.downcase}"
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # https://github.com/jnicklas/carrierwave/wiki
  # Heroku has a read-only filesystem, so uploads must be stored on S3 and cannot be cached in the public
  # directory. You can work around the caching limitation by setting the cache_dir in your Uploader classes
  # to the tmp directory.
  #def cache_dir
  #  "#{Rails.root}/tmp/uploads"
  #end

end
