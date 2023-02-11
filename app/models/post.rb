class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  #tag_mapsを中間テーブルとしてtagsとの関連付け

  belongs_to :end_user

  validates :title, presence: true
  validates :text, presence: true

  def save_tags(tags)

    tag_list = tags.split(/[[:blank:]]+/)
    #タグをスペースで分割し配列にする
    #最後の"+"で連続した空白も対応

    current_tags =self.tags.pluck (:name)

    old_tags = current_tags - tag_list
    #(1)記事更新時に削除されたタグ

    new_tags = tag_list - current_tags
    #(2)新規に追加されたタグ

    p current_tags

    #tag_mapsテーブルから(1)のタグを削除
    old_tags.each do |old|

      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|

      new_post_tag = Tag.find_or_create_by(name: new)

      self.tags << new_post_tag
    end
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)

  end



  def get_image(width, height)

    image.variant(resize_to_limit: [width, height]).processed

  end

  def self.search(search) #self.でクラスメソッドとしている
    if search
      Post.where(['title LIKE ?', "%#{search}%"])

    else
      Post.all
    end
  end
end