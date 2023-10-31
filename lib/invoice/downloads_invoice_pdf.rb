module Invoice::DownloadsInvoicePdf
  include Invoice::ReturnsInvoicePdf

  # Downloads a PDF file containing information from a specific invoice.
  #
  # This method uses the `returns_invoice_pdf` method from the `Invoice::ReturnsInvoicePdf`
  # module to generate a PDF file with information from a specified invoice. It then serves
  # the generated PDF file for download.
  #
  # @param [Invoice] invoice The invoice object from which the PDF is generated
  #
  # @return [void]
  def download_invoice_pdf(invoice)
    pdf = returns_invoice_pdf(invoice)

    send_data(
      pdf.render,
      filename:"invoice#{invoice.invoice_number}.pdf",
      type: 'application/pdf',
    )
  end
end