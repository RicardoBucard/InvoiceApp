module Invoice::ReturnsInvoicePdf
  def returns_invoice_pdf(invoice)
    if invoice.present?
      pdf = Prawn::Document.new
      pdf.font_size 30
      pdf.text 'Invoice', align: :center
      pdf.move_down 30
      pdf.font_size 16
      invoice.attributes.each do |attr_name, attr_value|
        unless ['id', 'created_at', 'updated_at'].include?(attr_name)
          pdf.text "#{attr_name.titleize}: #{attr_value}", align: :center
          pdf.move_down 30
        end
      end
    end
    pdf
  end
end