class AnswersController < ApplicationController

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    redirect_to question_path(@question)
  end

  def up_vote
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.up_vote
    redirect_to @question
  end

  def down_vote
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.down_vote
    redirect_to @question
  end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end

end
