require 'capybara/rspec'

# describe "displaying list of questions", :type => :feature do
#   it "loads list of questions" do
#     visit '/questions'
#     within("#questions") do
#       fill_in
#     end
#     click_link('')
#   end
# end

describe 'home page' do
 it "visits website" do
    visit '/'
    expect(page).to have_http_status(200)
  end

  it 'Contains the main page header' do
    visit '/'
    expect(page).to have_content "DBC Underflow"
  end

  it "when I click on list question, it goes to the questions" do
    question1 = Question.create!(title: "asdfsdf", content: "sadfsadf")
    visit "/questions"
    click_link("asdfsdf")
    expect(page).to have_content "asdfsdf"
  end


end
