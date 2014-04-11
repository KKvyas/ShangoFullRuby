class LengthsController < ApplicationController
  before_action :set_length, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  def index
    @lengths = Length.all
  end


  def show
  end


  def new
    @length = Length.new
  end


  def edit
  end


  def create
    @length = Length.new(length_params)

    respond_to do |format|
      if @length.save
        format.html { redirect_to @length, notice: 'Length was successfully created.' }
        format.json { render action: 'show', status: :created, location: @length }
      else
        format.html { render action: 'new' }
        format.json { render json: @length.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @length.update(length_params)
        format.html { redirect_to @length, notice: 'Length was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @length.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @length.destroy
    respond_to do |format|
      format.html { redirect_to lengths_url }
      format.json { head :no_content }
    end
  end

  private
    def set_length
      @length = Length.find(params[:id])
    end

    def length_params
      params.require(:length).permit(:description)
    end
end
