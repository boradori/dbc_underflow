class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :content, presence: true

  def up_vote
    self.votes += 1
    self.save
  end

  def down_vote
    self.votes -= 1
    self.save
  end
end
