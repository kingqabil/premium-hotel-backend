class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    user = User.new(user_params)
    if user.save
      render json: { msg: 'Account created' }, status: :created
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
