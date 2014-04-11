module ControllersHelper
	def authenticate_guide
		confirm_signed_in
		if current_user
			redirect_to profile_path unless current_user.guide?
		end
	end

	def authenticate_admin
		confirm_signed_in
		if current_user
			redirect_to profile_path unless current_user.admin?
		end
	end

	def confirm_signed_in
		unless user_signed_in?
			flash.now[:notice] = 'Please sign in.'
			redirect_to new_user_session_path
		end
	end

	def authenticate_company_owner

	end

	def set_user
		@user = current_user
	end
end