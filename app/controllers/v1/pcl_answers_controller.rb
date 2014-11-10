class V1::PclAnswersController < ApplicationController

  def create
    @answer = PclAnswer.new(pcl_answer_params)

    respond_to do |format|
      if @answer.save
        format.json { head :no_content }
      else
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def pcl_answer_params
      params.require(:pcl_answer).permit([:user_id, :tpo_question_id, :section_number, :is_correct, :option])
    end
end
