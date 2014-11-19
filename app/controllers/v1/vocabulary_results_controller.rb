class V1::VocabularyResultsController < ApplicationController

  def create
    VocabularyResult.where("user_id = ? AND vocabulary_group_id = ?", params[:user_id], params[:vocabulary_group_id]).each do |p|
      p.destroy
    end

    vocabulary_results = []

    vocabulary_results_params.each do |p|
      vocabulary_result = VocabularyResult.new(p)
      vocabulary_results << vocabulary_result if vocabulary_result.save
    end

    head :no_content
  end

  def vocabulary_results_params
    params.require(:vocabulary_results).map do |p|
       ActionController::Parameters.new(p.to_hash).permit(:vocabulary_question_id, :user_id, :vocabulary_group_id)
     end
  end
end
