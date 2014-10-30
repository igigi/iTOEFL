class GrammarGroupsController < ApplicationController
  before_action :set_grammar_group, only: [:show, :edit, :update, :destroy]

  # GET /grammar_groups
  def index
    @grammar_groups = GrammarGroup.all
  end

  # GET /grammar_groups/1
  def show
  end

  # GET /grammar_groups/new
  def new
    @grammar_group = GrammarGroup.new
  end

  # GET /grammar_groups/1/edit
  def edit
  end

  # POST /grammar_groups
  def create
    @grammar_group = GrammarGroup.new(grammar_group_params)

    if @grammar_group.save
      redirect_to @grammar_group, notice: 'Grammar group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grammar_groups/1
  def update
    if @grammar_group.update(grammar_group_params)
      redirect_to @grammar_group, notice: 'Grammar group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grammar_groups/1
  def destroy
    @grammar_group.destroy
    redirect_to grammar_groups_url, notice: 'Grammar group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grammar_group
      @grammar_group = GrammarGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def grammar_group_params
      params.require(:grammar_group).permit(:sequence_number, :group_type)
    end
end
