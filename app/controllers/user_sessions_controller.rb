class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_path, notice: 'Вы успешно вошли'
    else
      flash.now[:alert] = 'Ошибка входа'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Выход выполнен!'
  end
end
