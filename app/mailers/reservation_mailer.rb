class ReservationMailer < ApplicationMailer
  default from: 'josejulian_rodriguez@ucol.mx'
  
  def confirmation_email(reservation)
    @evento = reservation.evento
    @reservation = reservation
    mail(to: reservation.correo, subject: 'Confirmación de reserva')
  end
end