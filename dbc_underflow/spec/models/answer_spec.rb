require "rails_helper"

RSpec.describe Answer do
  it "has none to begin with" do
    expect(Answer.count).to eq 0
  end

  it "has one after adding one" do
    Answer.create(content: "My answer")
    expect(Answer.count).to eq 1
  end

  it "content should be present" do
    answer = Answer.create(content: "My answer")
    expect(answer.content) != nil
  end

  it "should not accept an empty answer" do
    Answer.create(content: nil)
    expect(Answer.count).to eq 0
  end

  describe Answer do
    it { should belong_to(:question) }
  end

end
