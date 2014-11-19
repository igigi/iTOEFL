class V1::GrammarResultsController < ApplicationController

  def create
    GrammarResult.where("user_id = ? AND grammar_group_id = ?", params[:user_id], params[:grammar_group_id]).each do |p|
      p.destroy
    end
    grammar_results = []

    grammar_results_params.each do |p|
      grammar_result = GrammarResult.new(p)
      grammar_results << grammar_result if grammar_result.save
    end

    head :no_content
  end

  def grammar_results_params
    params.require(:grammar_results).map do |p|
       ActionController::Parameters.new(p.to_hash).permit(:grammar_question_id, :user_id, :grammar_group_id)
     end
  end
end
