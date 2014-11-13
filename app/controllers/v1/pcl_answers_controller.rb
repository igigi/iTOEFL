class V1::PclAnswersController < ApplicationController

  def create
    pcl_answers = []

    pcl_answer_params.each do |p|
      pcl_answer = PclAnswer.new(p)
      pcl_answers << pcl_answer if pcl_answer.save
    end

    head :no_content
  end

  def pcl_answer_params
    params.require(:pcl_answers).map do |p|
       ActionController::Parameters.new(p.to_hash).permit(:tpo_question_id, :user_id, :section_number, :is_correct, :option)
     end
  end
end
