class Image < ActiveRecord::Base
  # has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :file,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :file, :attachment_presence => true

  def as_json options = {}
    super :methods => [:url, :medium]
  end

  def url
    file.url
  end

  def medium
    file.url(:medium)
  end
end
