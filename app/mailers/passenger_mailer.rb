class PassengerMailer < ApplicationMailer
  default from: 'from@example.com'

  def booking_email
    @user = params[:user]
    @booking = params[:booking]
    mail(to: @booking.passengers.pluck(:email), subject: 'Flight Booker Confirmation')
  end
end
