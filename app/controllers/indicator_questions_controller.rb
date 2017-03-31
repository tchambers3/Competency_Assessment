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
      flash[:notice] = "Successfully added #{question.title} question to this indicator"
  end

  def edit
  end

  def update
  end

  def update
  end

  def destroy
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
