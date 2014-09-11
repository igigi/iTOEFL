class V1::RbCommentsController < ApplicationController
  before_action :set_rb_comment, only: [:show, :edit, :update, :destroy]

  # GET /rb_comments
  # GET /rb_comments.json
  def index
    @rb_comments = RbComment.where(recorded_broadcast_id: params[:recorded_broadcast_id]).paginate(page: params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rb_comments }
    end
  end

  # GET /rb_comments/1
  # GET /rb_comments/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rb_comment }
    end
  end

  # GET /rb_comments/new
  def new
    @rb_comment = RbComment.new
  end

  # GET /rb_comments/1/edit
  def edit
  end

  # POST /rb_comments
  # POST /rb_comments.json
  def create
    @rb_comment = RbComment.new(rb_comment_params)

    respond_to do |format|
      if @rb_comment.save
        format.html { redirect_to @rb_comment, notice: 'Rb comment was successfully created.' }
        format.json { render json: @rb_comment, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @rb_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rb_comments/1
  # PATCH/PUT /rb_comments/1.json
  def update
    respond_to do |format|
      if @rb_comment.update(rb_comment_params)
        format.html { redirect_to @rb_comment, notice: 'Rb comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rb_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rb_comments/1
  # DELETE /rb_comments/1.json
  def destroy
    @rb_comment.destroy
    respond_to do |format|
      format.html { redirect_to rb_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rb_comment
      @rb_comment = RbComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rb_comment_params
      params.require(:rb_comment).permit(:content, :user_id, :recorded_broadcast_id)
    end
end
