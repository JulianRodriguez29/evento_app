class ReservationsController < ApplicationController
  def new
    @evento = Evento.find(params[:evento_id])
    @reservation = Reservation.new
  end

  def create
    @evento = Evento.find(params[:evento_id])
    @reservation = @evento.reservations.build(reservation_params)
    if @reservation.save
      redirect_to confirmar_reservacion_evento_path(@evento)
    else
      render :new
    end
  end

  def confirmar_reservacion
    @evento = Evento.find(params[:id])
    nombre = params[:nombre]
    correo = params[:correo]
    curp = params[:curp]

    # Logic to create the reservation and send confirmation email
    if nombre.present? && correo.present? && curp.present?
      # Create the reservation
      reservation = Reservation.create(nombre: nombre, correo: correo, curp: curp, evento: @evento)

      # Send confirmation email
      ReservationMailer.confirmation_email(reservation).deliver_later

      # Redirect or render a success message
      redirect_to confirmar_reservacion_evento_path(@evento)
    else
      # Handle validation errors or incomplete information
      redirect_to reservar_evento_path(@evento), alert: "Please provide all the required information."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:nombre, :correo, :curp)
  end
end
