class LbCommentsController < ApplicationController
  before_action :set_lb_comment, only: [:show, :edit, :update, :destroy]

  # GET /lb_comments
  # GET /lb_comments.json
  def index
    @lb_comments = LbComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lb_comments }
    end
  end

  # GET /lb_comments/1
  # GET /lb_comments/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lb_comment }
    end
  end

  # GET /lb_comments/new
  def new
    @lb_comment = LbComment.new
  end

  # GET /lb_comments/1/edit
  def edit
  end

  # POST /lb_comments
  # POST /lb_comments.json
  def create
    @lb_comment = LbComment.new(lb_comment_params)

    respond_to do |format|
      if @lb_comment.save
        format.html { redirect_to @lb_comment, notice: 'Lb comment was successfully created.' }
        format.json { render json: @lb_comment, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @lb_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lb_comments/1
  # PATCH/PUT /lb_comments/1.json
  def update
    respond_to do |format|
      if @lb_comment.update(lb_comment_params)
        format.html { redirect_to @lb_comment, notice: 'Lb comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lb_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lb_comments/1
  # DELETE /lb_comments/1.json
  def destroy
    @lb_comment.destroy
    respond_to do |format|
      format.html { redirect_to lb_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lb_comment
      @lb_comment = LbComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lb_comment_params
      params.require(:lb_comment).permit(:content, :user_id, :live_broadcast_id)
    end
end
