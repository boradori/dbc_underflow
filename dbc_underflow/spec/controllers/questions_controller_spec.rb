require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe 'GET #index' do
    context 'displays list of questions' do
      it 'renders the :index view' do
        get :index
        expect(response).to render_template(:index)
      end
      it  "has a 200 status code"  do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    context 'displays a question' do
      it 'renders the :show view' do
        question = Question.create!(title: "yooooo", content: "lo")
        get :show, id: question.id
        expect(response).to render_template(:show)
      end
      it  "has a 200 status code"  do
        question = Question.create!(title: "yooooo", content: "lo")
        get :show, id: question.id
        expect(response.status).to eq(200)
      end
    end
  end
end
