class Api::V1::ReservationsController < ApplicationController
  before_action :authorize_request
  before_action :set_reservation, only: :destroy

  def index
    @reservations = @current_user.reservations
  end

  def create
    @reservation = @current_user.reservations.new(reservation_params)

    if @reservation.save
      render :create, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation has been successfully deleted' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :room_id)
  end
end
