class ContactMailer < ApplicationMailer
  def contact_mail(contact)
  @contact = contact
  mail to:"a.kirigo.t0630@gmail.com",subject: "confirmation"
  end
end
