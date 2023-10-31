module Email::SendsInvoiceEmail

  # Sends an invoice to the emails provided using InvoiceMailer.
  #
  # This method triggers the sending of an email with an invoice attached using the
  # `InvoiceMailer`. It queues the email to be sent asynchronously for later delivery.
  #
  # @param [Invoice] invoice The invoice object to be included in the email
  # @param [Array<String>, nil] emails (Optional) An array of email addresses to send the invoice email to
  #
  # @return [void]
  def sends_invoice_email(invoice, emails = nil)
    InvoiceMailer.send_email(invoice, emails).deliver_later
  end
end
  