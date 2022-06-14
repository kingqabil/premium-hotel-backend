class Api::V1::SessionsController < Devise::SessionsController
    respond_to :json
    include JsonWebToken
  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      @current_user = user
          token = jwt_encode(user_id: user.id)
          time = Time.now + 7.days.to_i
          render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                         data: user }, status: :ok
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end

    
  end
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end