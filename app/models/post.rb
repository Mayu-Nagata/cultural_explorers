class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)

  end



  def get_image(width, height)

    image.variant(resize_to_limit: [width, height]).processed

  end

  belongs_to :end_user
end
