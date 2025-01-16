class ApplicationMailer < ActionMailer::Base
  default(
    from: email_address_with_name(
      "bookings@odin.example.com",
      "Odin Flights"
    )
  )
  layout "mailer"
end
