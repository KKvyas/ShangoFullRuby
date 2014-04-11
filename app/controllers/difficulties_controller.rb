class DifficultiesController < ApplicationController
  before_action :set_difficulty, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  def index
    @difficulties = Difficulty.all
  end


  def show
  end


  def new
    @difficulty = Difficulty.new
  end


  def edit
  end


  def create
    @difficulty = Difficulty.new(difficulty_params)

    respond_to do |format|
      if @difficulty.save
        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully created.' }
        format.json { render action: 'show', status: :created, location: @difficulty }
      else
        format.html { render action: 'new' }
        format.json { render json: @difficulty.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @difficulty.update(difficulty_params)
        format.html { redirect_to @difficulty, notice: 'Difficulty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @difficulty.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @difficulty.destroy
    respond_to do |format|
      format.html { redirect_to difficulties_url }
      format.json { head :no_content }
    end
  end

  private
    def set_difficulty
      @difficulty = Difficulty.find(params[:id])
    end

    def difficulty_params
      params.require(:difficulty).permit(:description)
    end
end
