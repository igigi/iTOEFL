class GrammarQuestionsController < ApplicationController
  before_action :set_grammar_question, only: [:show, :edit, :update, :destroy]

  # GET /grammar_questions
  def index
    @grammar_questions = GrammarQuestion.all
  end

  # GET /grammar_questions/1
  def show
  end

  # GET /grammar_questions/new
  def new
    @grammar_question = GrammarQuestion.new
  end

  # GET /grammar_questions/1/edit
  def edit
  end

  # POST /grammar_questions
  def create
    @grammar_question = GrammarQuestion.new(grammar_question_params)

    if @grammar_question.save
      redirect_to @grammar_question, notice: 'Grammar question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grammar_questions/1
  def update
    if @grammar_question.update(grammar_question_params)
      redirect_to @grammar_question, notice: 'Grammar question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grammar_questions/1
  def destroy
    @grammar_question.destroy
    redirect_to grammar_questions_url, notice: 'Grammar question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grammar_question
      @grammar_question = GrammarQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grammar_question_params
      params.require(:grammar_question).permit(:sequence_number, :content, :grammar_group_id)
    end
end
