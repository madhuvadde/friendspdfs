class PostMailer < ActionMailer::Base

	def post_created(user)
		mail(to: user.email,
			 from: "services@gmail.com",
			 subject:"post created",
			 body:"this is my first mailer")
	end
end