module Email::SendsInvoiceEmail
  def sends_invoice_email(invoice, emails = nil)
    InvoiceMailer.send_email(invoice, emails).deliver_later
  end
end
  