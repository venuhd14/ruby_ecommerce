class Product < ApplicationRecord
  has_one_attached :image

  validate :image_format

  private

  def image_format
    return unless image.attached?
    
    if !image.content_type.in?(%('image/jpeg image/png'))
      errors.add(:image, 'must be a JPEG or PNG')
    end
  end
end
