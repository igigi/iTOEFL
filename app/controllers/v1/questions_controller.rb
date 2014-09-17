class V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  serialization_scope :current_user

  # GET /questions
  # GET /questions.json
  def index
    if params[:source] && params[:subject] && params[:set]
      @questions = Question.by_source(params[:source]).by_subject(params[:subject]).by_set(params[:set]).ids
    elsif params[:source] && params[:subject] && params[:number]
      @questions = Question.by_source(params[:source]).by_subject(params[:subject]).by_number(params[:number]).ids
    elsif params[:source] && params[:subject]
      @questions = Question.by_source(params[:source]).by_subject(params[:subject]).order(:set).ids
    else
      @questions = {}
    end

    respond_to do |format|
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
    def current_user
      User.find_by(auth_token: request.headers["token"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:content, :tip, :related_resource, :set, :number, :subject, :source, :difficulty)
    end
end
