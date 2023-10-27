module Invoice::ReadsInvoicePdf
  include Invoice::ReturnsInvoicePdf

  def reads_pdf(invoice)
    pdf = returns_invoice_pdf(invoice)
    Tempfile.create do |f|
      pdf.render_file f
      f.flush
      File.read(f)
    end
  end
end