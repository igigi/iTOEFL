class V1::QuestionHistoriesController < ApplicationController
  before_action :set_question_history, only: [:show, :edit, :update, :destroy]

  # GET /question_histories
  # GET /question_histories.json
  def index
    if params[:question_id]
      @question_histories = QuestionHistory.other_history(params[:question_id], current_user.id).paginate(page: params[:page])
    else
      @question_histories = QuestionHistory.all
    end

    respond_to do |format|
      format.json { render json: @question_histories }
    end
  end

  # GET /question_histories/1
  # GET /question_histories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_history }
    end
  end

  # GET /question_histories/new
  def new
    @question_history = QuestionHistory.new
  end

  # GET /question_histories/1/edit
  def edit
  end

  # POST /question_histories
  # POST /question_histories.json
  def create
    @question_history = QuestionHistory.new(question_history_params)

    respond_to do |format|
      if @question_history.save
        format.html { redirect_to @question_history, notice: 'Question history was successfully created.' }
        format.json { render json: @question_history, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @question_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_histories/1
  # PATCH/PUT /question_histories/1.json
  def update
    respond_to do |format|
      if @question_history.update(question_history_params)
        format.html { redirect_to @question_history, notice: 'Question history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_histories/1
  # DELETE /question_histories/1.json
  def destroy
    @question_history.destroy
    respond_to do |format|
      format.html { redirect_to question_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_history
      @question_history = QuestionHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_history_params
      params.require(:question_history).permit(:user_id, :question_id, :is_correct, :answer)
    end
end
