class V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:question_id]
      @tasks = Task.other_history(params[:question_id], current_user.id).paginate(page: params[:page])
    else
      @tasks = Task.all
    end

    respond_to do |format|
      format.json { render json: @tasks }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.json { render json: @task, status: :created }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.json { head :no_content }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :question_id, :is_correct, :answer, :remark, :share)
    end
end
