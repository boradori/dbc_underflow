class Answer < ActiveRecord::Base
  belongs_to :question
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
