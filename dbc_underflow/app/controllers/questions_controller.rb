require 'httparty'

class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @questionlink = @question.title
    # if @question.save
      # redirect_to @question
    # else
      # render :new
      p @question
      respond_to do |format|
      if @question.save
        format.js { render 'create'}
        format.html { redirect_to questions_path }
      else
        format.html {}
        format.js {}
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def up_vote
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.up_vote
        format.js { render 'votes'}
        format.html { redirect_to @question }
      else
        format.html {}
        format.js {}
      end
    end
  end

  def down_vote
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.down_vote
        format.html { redirect_to @question }
        format.js { render 'votes'}
      else
        format.html {}
        format.js {}
      end
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
