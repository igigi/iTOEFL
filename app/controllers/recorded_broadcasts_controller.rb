class RecordedBroadcastsController < ApplicationController
  before_action :set_recorded_broadcast, only: [:show, :edit, :update, :destroy]

  # GET /recorded_broadcasts
  # GET /recorded_broadcasts.json
  def index
    if params[:broadcast_set_id]
      @recorded_broadcasts = RecordedBroadcast.where(broadcast_set_id: params[:broadcast_set_id])
    else 
      @recorded_broadcasts = RecordedBroadcast.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recorded_broadcasts }
    end
  end

  # GET /recorded_broadcasts/1
  # GET /recorded_broadcasts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recorded_broadcast }
    end
  end

  # GET /recorded_broadcasts/new
  def new
    @recorded_broadcast = RecordedBroadcast.new
  end

  # GET /recorded_broadcasts/1/edit
  def edit
  end

  # POST /recorded_broadcasts
  # POST /recorded_broadcasts.json
  def create
    @recorded_broadcast = RecordedBroadcast.new(recorded_broadcast_params)

    respond_to do |format|
      if @recorded_broadcast.save
        format.html { redirect_to @recorded_broadcast, notice: 'Recorded broadcast was successfully created.' }
        format.json { render json: @recorded_broadcast, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @recorded_broadcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recorded_broadcasts/1
  # PATCH/PUT /recorded_broadcasts/1.json
  def update
    respond_to do |format|
      if @recorded_broadcast.update(recorded_broadcast_params)
        format.html { redirect_to @recorded_broadcast, notice: 'Recorded broadcast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recorded_broadcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recorded_broadcasts/1
  # DELETE /recorded_broadcasts/1.json
  def destroy
    @recorded_broadcast.destroy
    respond_to do |format|
      format.html { redirect_to recorded_broadcasts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recorded_broadcast
      @recorded_broadcast = RecordedBroadcast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recorded_broadcast_params
      params.require(:recorded_broadcast).permit(:title, :cover, :summary, :video_url, :broadcast_set_id)
    end
end
