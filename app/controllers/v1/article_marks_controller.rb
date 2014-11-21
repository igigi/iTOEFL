class V1::ArticleMarksController < ApplicationController

  def create
    @mark = ArticleMark.new(article_mark_params)

    respond_to do |format|
      if @mark.save
        format.json { head :no_content }
      else
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_mark_params
      params.require(:article_mark).permit(:user_id, :article_id, :score, :mark_type, mark_tips_attributes: [:start_index, :end_index, :audio_url, :text_content])
    end
end
