module SessionsHelper

	def sign_in(user) # Courtesy of https://www.railstutorial.org/book/sign_in_out
	  remember_token = User.new_remember_token
	  cookies.permanent[:remember_token] = remember_token
	  user.update_attribute(:remember_token, User.digest(remember_token))
	  self.current_user = user
	end

end
