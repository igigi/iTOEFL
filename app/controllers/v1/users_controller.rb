class V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def verify_open_id
    if user = User.find_by(open_id: params[:open_id])
      captcha = [*'0'..'9'].sample(6).join
      user.update(captcha: captcha)
      if user.origin == "mail"
        UserMailer.captcha_email(user).deliver
      else
        UserSms.captcha_sms(user)
      end
      head :ok
    else
      head 404
    end
  end

  def verify_captcha
    if user = User.find_by(open_id: params[:open_id])
      if user.captcha == params[:captcha]
        render json: user, status: :ok
      else
        head 423
      end
    else
      head 423
    end
  end

  def login
    if user = User.find_by(open_id: params[:open_id])
      if user.origin == "qq" || user.origin == "weibo"
        render json: user, status: :ok
      elsif user.password == params[:password]
        render json: user, status: :ok
      else
        head 423
      end
    else
      if params[:origin] == "qq" || params[:origin] == "weibo"
        # user = User.create(open_id: params[:open_id], nickname: params[:nickname], origin: params[:origin])
        user = User.new
        user.open_id = params[:open_id]
        user.origin = params[:origin]
        user.nickname = params[:nickname]
        user.avatar = params[:avatar]
        user.save
        render json: user, status: :ok
      else
        head 404
      end
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    if @user.captcha == user_params[:captcha]
      respond_to do |format|
          if @user.update(user_params)
            format.json { head :no_content }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      end
    else
      head 423
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:captcha, :origin, :open_id, :password, :auth_token, :nickname, :avatar)
    end
end
