require "rails_helper"

RSpec.describe Question do
  it "has none to begin with" do
    expect(Question.count).to eq 0
  end

  it "has one after adding one" do
    Question.create(title: "Fudge", content: "Me")
    expect(Question.count).to eq 1
  end

  it "should not add if title character is less than 5" do
    Question.create(title: "Ahh", content: "hmmm")
    expect(Question.count).to eq 0
  end

  it "title and content should be present" do
    question = Question.create(title: "hohoho", content: "My skdlajf")
    expect(question.content) != nil
  end

  it "should not accept an empty title and content" do
    Question.create(content: nil)
    expect(Question.count).to eq 0
  end

  it "should add a vote when clicking up_vote" do
    question = Question.create(title: "fuckkk", content: "You")
    question.up_vote
    expect(question.votes).to eq 1
  end

  it "should decrease vote count when clicking down_vote" do
    question = Question.create(title: "fuckkk", content: "You")
    question.down_vote
    expect(question.votes).to eq -1
  end


  describe Question do
    it { should have_many(:answers) }
  end
end
