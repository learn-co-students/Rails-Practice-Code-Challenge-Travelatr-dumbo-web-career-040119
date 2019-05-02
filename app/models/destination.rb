class Destination < ApplicationRecord
  has_many :posts, :dependent => :delete_all
  has_many :bloggers, through: :posts

  def bloggers
    self.posts.map(&:blogger)
  end

  def bloggers_age
    self.bloggers.map(&:age)
  end

  def sum
   inject(0) { |sum, x| sum + x }
  end

  def bloggers_average_age
    self.bloggers_age.sum / self.bloggers.size
  end

  def most_recent
    self.posts.last(5)
  end

  def featured_post
    self.posts.sort_by{|post| post.likes}.last
  end



  # def get_posts_by_bloggers
  #   Posts.all.map(&:blogger_id)
  # end

end
