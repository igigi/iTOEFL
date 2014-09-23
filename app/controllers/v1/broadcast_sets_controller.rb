class V1::BroadcastSetsController < ApplicationController
  before_action :set_broadcast_set, only: [:count, :show, :edit, :update, :destroy]

  def count
    if params[:counter] == "add"
      @broadcast_set.subscribe_count += 1
      if @broadcast_set.save
        head :no_content
      end
    else params[:counter] == "-"
      @broadcast_set.subscribe_count -= 1
      if @broadcast_set.save
        head :no_content
      end
    end
  end

  # GET /broadcast_sets
  # GET /broadcast_sets.json
  def index
    @broadcast_sets = BroadcastSet.paginate(page: params[:page])

    respond_to do |format|
      format.json { render json: @broadcast_sets }
    end
  end

  # GET /broadcast_sets/1
  # GET /broadcast_sets/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @broadcast_set }
    end
  end

  # GET /broadcast_sets/new
  def new
    @broadcast_set = BroadcastSet.new
  end

  # GET /broadcast_sets/1/edit
  def edit
  end

  # POST /broadcast_sets
  # POST /broadcast_sets.json
  def create
    @broadcast_set = BroadcastSet.new(broadcast_set_params)

    respond_to do |format|
      if @broadcast_set.save
        format.html { redirect_to @broadcast_set, notice: 'Broadcast set was successfully created.' }
        format.json { render json: @broadcast_set, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @broadcast_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /broadcast_sets/1
  # PATCH/PUT /broadcast_sets/1.json
  def update
    respond_to do |format|
      if @broadcast_set.update(broadcast_set_params)
        format.html { redirect_to @broadcast_set, notice: 'Broadcast set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @broadcast_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcast_sets/1
  # DELETE /broadcast_sets/1.json
  def destroy
    @broadcast_set.destroy
    respond_to do |format|
      format.html { redirect_to broadcast_sets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast_set
      @broadcast_set = BroadcastSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def broadcast_set_params
      params.require(:broadcast_set).permit(:title, :description, :cover)
    end
end
