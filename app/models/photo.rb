class Photo < ActiveRecord::Base

  class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  end

end
