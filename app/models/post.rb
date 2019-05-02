class Post < ApplicationRecord

  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 100}

  # def like
  # self.likes += 1
  # self.save
  # end

  #
  # def most_liked_blogger
  #   Post.all.sort_by{|post| post.likes}.last.blogger.name
  # end
  #
  # def most_liked_destination
  #   Post.all.sort_by{|post| post.likes}.last.blogger.name
  # end

end
