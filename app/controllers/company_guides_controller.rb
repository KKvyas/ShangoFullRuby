class CompanyGuidesController < ApplicationController

	def new
		@company_guide = CompanyGuide.new
		@companies = Company.all
	end

	def edit
	end

	def create
		@company_guide = CompanyGuide.new(company_guide_params)

		respond_to do |format|
			if @company_guide.save
				format.html { redirect_to profile_path, notice: 'Your request has been sent.' }
				format.json { render action: 'show', status: :created, location: @company_guide }
			else
				format.html { render action: 'new' }
				format.json { render json: @company_guide.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @company_guide.update(company_guide_params)
				format.html { redirect_to @company_guide, notice: 'Your response has been received.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @company_guide.errors, status: :unprocessable_entity }
			end
		end
	end


	def destroy
		@company_guide.destroy
		respond_to do |format|
			format.html { redirect_to company_guides_url }
			format.json { head :no_content }
		end
	end

	private

		def company_guide_params
			params.require(:company_guide).permit(  :company_id,
													:guide_id,
													:guide_confirmed,
													:company_confirmed)
		end
end
