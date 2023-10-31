module Invoice::ReturnsInvoicePdf
  
  # Creates and returns a PDF representation for a provided invoice.
  #
  # This method checks if the provided invoice is present. If an invoice is provided, it generates a PDF file
  # containing information based on the attributes of the invoice. It uses the Prawn gem to construct the PDF,
  # detailing attributes of the invoice.
  #
  # @param [Invoice] invoice The invoice object used to create the PDF representation
  #
  # @return [PDF, nil] The generated PDF document or nil if the invoice is not present
  def returns_invoice_pdf(invoice)
    if invoice.present?
      pdf = Prawn::Document.new
      pdf.font_size 30
      pdf.text 'Invoice', align: :center
      pdf.move_down 30
      pdf.font_size 16
      invoice.attributes.each do |attr_name, attr_value|
        unless ['id', 'created_at', 'updated_at'].include?(attr_name)
          pdf.text "#{attr_name.titleize}: R$ #{attr_value.to_s.gsub('.',',')}", align: :center if attr_name == 'invoice_value'
          pdf.text "#{attr_name.titleize}: #{attr_value}", align: :center unless attr_name == 'invoice_value'
          pdf.move_down 30
        end
      end
    end
    pdf
  end
end