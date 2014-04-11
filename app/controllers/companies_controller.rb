class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:index]

  def portal
  end

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
      session[:current_company_id] = @company.id
    end

    def company_params
      params.require(:company).permit(:name, :hq_address, :hq_city, :hq_state, :country, :description, :phone, :email, :owner_id, :contact_name)
    end
end
