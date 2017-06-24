class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(user_session_params[:email], user_session_params[:password])
      redirect_back_or_to(:users, notice: t('user_sessions.notice.signed_in'))
    else
      @user = User.new
      flash.now[:alert] = t('user_sessions.failure.invalid')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('user_sessions.notice.signed_out')
  end

  private

  def user_session_params
    params.require(:user).permit(:email, :password)
  end
end
