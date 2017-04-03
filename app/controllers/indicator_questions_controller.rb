class IndicatorQuestionsController < ApplicationController

  # Callback Methods
  before_action :set_indicator_question, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @indicator_question = IndicatorQuestion.new
  end

  def create
    @indicator_question = IndicatorQuestion.new(indicator_question_params)
    if @indicator_question.save
      # QUESTION: This assumes we add/delete IndicatorQuestions in the show question page
      # QUESTION: Should we truncate the question text so it only shows the first 5 words?
      flash[:notice] = "Successfully added '#{@indicator_question.indicator.text}' indicator to this question."
      redirect_to question_path(@indicator_question.question)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @indicator_question.update(indicator_question_params)
      flash[:notice] = "Successfully udpated Indicator Question mapping"
      redirect_to question_path(@indicator_question.question)
    else
      render "edit"
    end
  end

  def destroy
    @indicator_question.destroy
    flash[:notice] = "Successfully deleted Indicator Question mapping"
    # QUESTION: This assumes there is no view all indicator question mappings page
    redirect_to questions_path
  end

  #----------------------------------
  private
  #----------------------------------

  def set_indicator_question
    @indicator_question = IndicatorQuestion.find(params[:id])
  end

  def indicator_question_params
    params.require(:indicator_question).permit(:indicator_id, :question_id, :active)
  end

end
