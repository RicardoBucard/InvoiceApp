class InvoiceMailer < ApplicationMailer
  include Invoice::ReadsInvoicePdf
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
