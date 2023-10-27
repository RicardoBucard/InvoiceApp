module Invoice::DownloadsInvoicePdf
  include Invoice::ReturnsInvoicePdf

  def download_invoice_pdf(invoice)
    pdf = returns_invoice_pdf(invoice)

    send_data(
      pdf.render,
      filename:"invoice#{invoice.invoice_number}.pdf",
      type: 'application/pdf',
    )
  end
end