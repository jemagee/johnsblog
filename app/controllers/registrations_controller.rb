class RegistrationsController < Devise::RegistrationsController

	before_action :has_one_user_already?

	protected

		def has_one_user_already?
			if ((User.count == 1) & (user_signed_in?))
				redirect_to admin_root_path
			elsif User.count == 1
				flash[:warning] = "You can't sign up at this time"
				redirect_to root_path
			end
		end
end
