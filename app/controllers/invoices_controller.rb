class InvoicesController < ApplicationController
  include Email::SendsInvoiceEmail
  include Invoice::DownloadsInvoicePdf
  before_action :set_invoice, only: %i[ show download_pdf new_invoice_email sends_new_invoice_email ]
  skip_before_action :must_login, only: :show

  has_scope :filter_invoice_date
  has_scope :filter_invoice_number

  def index
    @invoices = apply_scopes(Invoice).all.page(params[:p]).per(5)
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def download_pdf
    download_invoice_pdf(@invoice)
  end

  def create
    @invoice = Invoice.new(invoice_params)
    
    respond_to do |format|
      if @invoice.save
        sends_invoice_email(@invoice)
        format.html { redirect_to invoice_url(@invoice), notice: t(".success_message") }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_invoice_email
  end

  def sends_new_invoice_email
    sends_invoice_email(@invoice, params[:emails])
    redirect_to invoice_url(@invoice), notice: t(".new_email_sent")
  end

  private
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def paginate_params
    params.permit(:page, :per_page)
  end

  def invoice_params
    params.require(:invoice).permit(:invoice_number, :invoice_date, :emitter_company, :charged_company, :invoice_value, :emails)
  end
end
