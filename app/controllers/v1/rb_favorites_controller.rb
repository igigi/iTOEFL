class V1::RbFavoritesController < ApplicationController
  before_action :set_rb_favorite, only: [:show, :edit, :update, :destroy]

  def create
    @rb_favorite = RbFavorite.new(rb_favorite_params)

    respond_to do |format|
      if @rb_favorite.save
        format.json { render json: @rb_favorite, status: :created }
      else
        format.json { render json: @rb_favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rb_favorite.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rb_favorite
      @rb_favorite = RbFavorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rb_favorite_params
      params.require(:rb_favorite).permit(:user_id, :recorded_broadcast_id)
    end
end
