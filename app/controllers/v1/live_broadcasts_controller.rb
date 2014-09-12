class V1::LiveBroadcastsController < ApplicationController
  before_action :set_live_broadcast, only: [:show, :edit, :update, :destroy]

  # GET /live_broadcasts
  # GET /live_broadcasts.json
  def index
    @live_broadcasts = LiveBroadcast.where.not(status: 3).order(start_at: :desc).paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @live_broadcasts }
    end
  end

  # GET /live_broadcasts/1
  # GET /live_broadcasts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @live_broadcast }
    end
  end

  # GET /live_broadcasts/new
  def new
    @live_broadcast = LiveBroadcast.new
  end

  # GET /live_broadcasts/1/edit
  def edit
  end

  # POST /live_broadcasts
  # POST /live_broadcasts.json
  def create
    @live_broadcast = LiveBroadcast.new(live_broadcast_params)

    respond_to do |format|
      if @live_broadcast.save
        format.html { redirect_to @live_broadcast, notice: 'Live broadcast was successfully created.' }
        format.json { render json: @live_broadcast, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @live_broadcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /live_broadcasts/1
  # PATCH/PUT /live_broadcasts/1.json
  def update
    respond_to do |format|
      if @live_broadcast.update(live_broadcast_params)
        format.html { redirect_to @live_broadcast, notice: 'Live broadcast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @live_broadcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /live_broadcasts/1
  # DELETE /live_broadcasts/1.json
  def destroy
    @live_broadcast.destroy
    respond_to do |format|
      format.html { redirect_to live_broadcasts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_broadcast
      @live_broadcast = LiveBroadcast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def live_broadcast_params
      params.require(:live_broadcast).permit(:title, :cover, :summary, :video_url, :start_at, :status)
    end
end
