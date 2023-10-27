module Email::SendsInvoiceEmail
  def sends_invoice_email(invoice)
    InvoiceMailer.send_email(invoice).deliver_later
  end
end
  