class V1::OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
 # before_action :set_discussion, only: [:index, :create]
  before_action :load_replied, except: [:destroy]

  # GET /opinions
  # GET /opinions.json
  def index
    @opinions = @replied.opinions.paginate(page: params[:page])
    render json: @opinions
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show
  end

  # GET /opinions/new
  def new
    @opinion = Opinion.new
  end

  # GET /opinions/1/edit
  def edit
  end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = @replied.opinions.build(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.json { render json: @opinion }
      else
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.update(status: 0)
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    def load_replied
      klass = [Discussion, Task].detect { |c| params["#{c.name.underscore}_id"] }
      @replied = klass.find(params["#{klass.name.underscore}_id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:content, :media_url, :seat, :discussion_id, :user_id, :media_type, :media_length,:owner_id)
    end
end
