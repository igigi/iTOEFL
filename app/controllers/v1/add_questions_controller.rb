class V1::AddQuestionsController < ApplicationController
  before_action :set_add_question, only: [:show, :edit, :update, :destroy]

  # GET /add_questions
  # GET /add_questions.json
  def index
    @add_questions = AddQuestion.all
  end

  # GET /add_questions/1
  # GET /add_questions/1.json
  def show
  end

  # GET /add_questions/new
  def new
    @add_question = AddQuestion.new
  end

  # GET /add_questions/1/edit
  def edit
  end

  # POST /add_questions
  # POST /add_questions.json
  def create
    @add_question = AddQuestion.new(add_question_params)

    respond_to do |format|
      if @add_question.save
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @add_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_questions/1
  # PATCH/PUT /add_questions/1.json
  def update
    respond_to do |format|
      if @add_question.update(add_question_params)
        format.html { redirect_to @add_question, notice: 'Add question was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_question }
      else
        format.html { render :edit }
        format.json { render json: @add_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_questions/1
  # DELETE /add_questions/1.json
  def destroy
    @add_question.destroy
    respond_to do |format|
      format.html { redirect_to add_questions_url, notice: 'Add question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_question
      @add_question = AddQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_question_params
      params.require(:add_question).permit(:content, :mark_id, :user_id)
    end
end
