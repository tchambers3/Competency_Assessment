require 'set'

class AssessmentsController < ApplicationController
  # Callback Methods
  before_action :set_competency, only: [:take, :generate_report, :report]

  COMPETENT_ANSWERS = ["always", "often"]
  DEVELOPING_ANSWERS = ["sometimes"]
  EMERGINg_ANSWERS = ["rarely", "never"]

  # GET /assessments
  def index
    @active_competencies = Competency.active.alphabetical
  end

  # GET /assessments/take
  def take
    @questions = Question.for_competency(@competency.id)
  end

  # POST /assessments/report
  def generate_report
    questions = params[:questions]

    @developing_stages = Hash.new
    @developing_stages[:competent] = Array.new
    @developing_stages[:developing] = Array.new
    @developing_stages[:emerging] = Array.new
    @developing_stages[:does_not_apply] = Array.new

    questions.each do |qid, answer_hash|
      answer = answer_hash[:answer]
      if COMPETENT_ANSWERS.include? answer
          @developing_stages[:competent] << qid
      elsif DEVELOPING_ANSWERS.include? answer
          @developing_stages[:developing] << qid
      elsif EMERGINg_ANSWERS.include? answer
          @developing_stages[:emerging] << qid
      else
          @developing_stages[:does_not_apply] << qid
      end
    end

    redirect_to report_assessment_path(competency_id: @competency, developing_stages: @developing_stages)
  end

  # GET /assessments/report
  def report
    @developing_stages = params[:developing_stages]
    @indicators_resources = Hash.new

    @developing_stages.each do |stage, qids|
      current_stage = Set.new

      questions = qids.map do |qid|
        Question.find(qid)
      end

      questions.each do |question|
        current_stage.merge(question.indicators)
      end

      @indicators_resources[stage] = 
        current_stage.to_a.sort {|a,b| a.level.ranking <=> b.level.ranking}
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_competency
    @competency = Competency.find(params[:competency_id])
  end
end
