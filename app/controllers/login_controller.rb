class LoginController < ApplicationController
  def index
  end

  def omniauth_call_back
    auth = request.env["omniauth.auth"]
    origin = auth.provider == 'weibo' ? 'weibo' : 'qq'
    user = User.where(origin: origin, open_id: auth.uid).first
    if user.blank?
      user = User.create(origin: origin, open_id: auth.uid, auth_token: auth.token, nickname: auth.info.nickname)
    end
    render json: user, status: :ok
  end
end
