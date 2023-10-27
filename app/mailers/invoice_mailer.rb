class InvoiceMailer < ApplicationMailer
  include Invoice::ReadsInvoicePdf
  def send_email(invoice)
    @invoice = invoice
    begin
      pdf = reads_pdf(@invoice)
    end until pdf or not sleep 30
    attachments["invoice-#{@invoice.invoice_number}.pdf"] = pdf
    mail to: @invoice.emails, subject: "Invoice-#{@invoice.invoice_number} from #{@invoice.emitter_company}"
  end
end
