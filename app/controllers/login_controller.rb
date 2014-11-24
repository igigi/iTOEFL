class LoginController < ApplicationController
  def index
  end

  def create
    omniauth = request.env["omniauth.auth"]
    puts "~~~~~~~~~~~~~~~~~~#{omniauth}"
    # if current_user
    #   unless current_user.authorizations.where(provider: 'github', uid: omniauth.uid).exists?
    #     Authorization.create(uid: omniauth.uid, provider: 'github', user_id: current_user.id)
    #   end
    # else
    #   author = Authorization.where(provider: 'github', uid: omniauth.uid).first
    #   if author
    #     session[:user_id] = author.user.id
    #   else
    #     user = User.create!(name: "游客#{User.maximum('id') + 1}", password: '123456')
    #     author = Authorization.create(uid: omniauth.uid, provider: 'github', user_id: user.id)
    #     session[:user_id] = user.id
    #   end
    # end
    # redirect_to '/'
    # session[:user_id] = User.first.id
    # authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    # if authentication
    #   flash[:notice] = "Signed in successfully."
    #   sign_in_and_redirect(:user, authentication.user)
    # elsif current_user
    #   current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
    #   flash[:notice] = "Authentication successful."
    #   redirect_to authentications_url
    # else
    #   user = User.new
    #   user.apply_omniauth(omniauth)
    #   if user.save
    #     flash[:notice] = "Signed in successfully."
    #     sign_in_and_redirect(:user, user)
    #   else
    #     session[:omniauth] = omniauth.except('extra')
    #     redirect_to new_user_registration_url
    #   end
    # end
  end
end
