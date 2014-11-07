class PassagesController < ApplicationController
  before_action :set_passage, only: [:show, :edit, :update, :destroy]

  # GET /passages
  # GET /passages.json
  def index
    # @passages = Passage.all
    @passages = Passage.where({parent_id: nil})
  end

  # GET /passages/1
  # GET /passages/1.json
  def show

    # if the requested passage is NOT a root passage (beginning of the story), then ender the show page for the requested passage's root passage.

    unless @passage.root == @passage
      redirect_to passage_url(@passage.root)
    end

    if logged_in?
      @child = Passage.new(:user_id => current_user.id)
    else
      @child = Passage.new(:user_id => 1) # user is dummy "Anonymous" user (1)
    end

  end

  # GET /passages/new
  def new
    if logged_in?
      @passage = Passage.new(:user_id => current_user.id)
    else
      @passage = Passage.new(:user_id => 1) # user is dummy "Anonymous" user (1)
    end
  end

  def home
    if logged_in?
      @passage = Passage.new(:user_id => current_user.id)
    else
      @passage = Passage.new(:user_id => 1) # user is dummy "Anonymous" user (1)
    end
  end

  # GET /passages/1/edit
  def edit
  end

  # POST /passages
  # POST /passages.json
  def create
    @passage = Passage.new(passage_params)

    respond_to do |format|
      if @passage.save
        format.html { redirect_to @passage, notice: 'Passage was successfully created.' }
        format.json { render :show, status: :created, location: @passage }
      else
        format.html { render :new }
        format.json { render json: @passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passages/1
  # PATCH/PUT /passages/1.json
  def update
    respond_to do |format|
      if @passage.update(passage_params)
        format.html { redirect_to @passage, notice: 'Passage was successfully updated.' }
        format.json { render :show, status: :ok, location: @passage }
      else
        format.html { render :edit }
        format.json { render json: @passage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passages/1
  # DELETE /passages/1.json
  def destroy
    @passage.destroy
    respond_to do |format|
      format.html { redirect_to passages_url, notice: 'Passage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passage
      @passage = Passage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passage_params
      params.require(:passage).permit(:user_id, :prompt_id, :text, :parent_id, :lft, :rgt)
    end
end
