module Invoice::ReadsInvoicePdf
  include Invoice::ReturnsInvoicePdf

  # Reads and returns a PDF file for a specific invoice.
  #
  # This method uses the `return_invoice_pdf` method from the `Invoice::Returns_Invoice_Pdf` module
  # to generate a PDF file containing information specific to the provided invoice. It creates a temporary
  # file, writes the PDF content into it, and then reads the file content as a string before returning it.
  #
  # @param [Invoice] invoice The invoice for which the PDF file is read
  #
  # @return [String] The content of the PDF file as a string
  def reads_pdf(invoice)
    pdf = returns_invoice_pdf(invoice)
    Tempfile.create do |f|
      pdf.render_file f
      f.flush
      File.read(f)
    end
  end
end