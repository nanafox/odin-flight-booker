class PassengerMailer < ApplicationMailer
  def confirm
    @passenger = params[:passenger]
    @booking = params[:booking]
    mail(
      to: email_address_with_name(@passenger.email, @passenger.name),
      subject: "Booking Confirmation"
    )
  end
end
