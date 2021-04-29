class UserMailer < ApplicationMailer
    default from: 'nathanhains14@yahoo.com'

    def welcome_email
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to Allegience!')
    end
end
