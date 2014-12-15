class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]


  def index
    
  end


  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new

    end
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались'
    else
      render action:  'new'
    end
  end



  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, pictures_attributes: [:picture])
  end

end
