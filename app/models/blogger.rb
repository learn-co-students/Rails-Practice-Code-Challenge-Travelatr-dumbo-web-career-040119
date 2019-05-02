class Blogger < ApplicationRecord
  has_many :posts, :dependent => :delete_all
  has_many :destinations, through: :posts

  validates :name, uniqueness: true, presence: true
  validates :age, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :bio, presence: true, length: {minimum: 30, too_short: "%{count} characters is the minimum allowed" }

  def likes
    self.posts.map(&:likes)
  end

  def sum
   inject(0){ |sum, x| sum + x }
  end

  def total_likes
    self.likes.sum
  end

  def most_liked_post
    self.posts.sort_by{|post| post.likes}.last
  end

  def destinations
    self.posts.map(&:destination)
  end




  #
  # def top_destinations
  #
  #   self.posts.map(&:destination)
  # end

end
