class InvoiceMailer < ApplicationMailer
  include Invoice::ReadsInvoicePdf

  # Generates and sends emails with an invoice attached
  #
  # This mailer action generates a PDF of an invoice using the `reads_pdf` method from
  # the `Invoice::ReadsInvoicePdf` module. It then checks if email addresses are
  # provided in the `emails` param. If `emails` is present, it sends the email the addresses; otherwise,
  # it sends the email to the addresses associated with the invoice instance.
  #
  # @param [Invoice] :invoice The invoice object to generate the PDF and email
  # @param [Array<String>, nil] :emails (Optional) A string that contains a list of email addresses
  # separated by comma to send the invoice email to
  #
  # @return [Mail::Message] The generated email message
  def send_email(invoice, emails = nil)
    @invoice = invoice
    begin
      pdf = reads_pdf(@invoice)
    end until pdf or not sleep 30
    attachments["invoice-#{@invoice.invoice_number}.pdf"] = pdf
    emails.present? ? (mail to: emails, subject: "Invoice-#{@invoice.invoice_number} from #{@invoice.emitter_company}") : 
                      (mail to: @invoice.emails, subject: "Invoice-#{@invoice.invoice_number} from #{@invoice.emitter_company}")
  end
end
