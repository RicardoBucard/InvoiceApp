class InvoicesController < ApplicationController
  include Email::SendsInvoiceEmail
  include Invoice::DownloadsInvoicePdf
  before_action :set_invoice, only: %i[ show download_pdf new_invoice_email sends_new_invoice_email ]
  skip_before_action :must_login, only: :show

  has_scope :filter_invoice_date
  has_scope :filter_invoice_number

  # GET /invoices
  #
  # Retrieves a paginated list of invoices
  #
  # @option params [Integer] :page The number of the page for pagination (default: 1)
  # @option params [Integer] :per_page The number of invoices per page (default: 5)
  #
  # @return [JSON] The paginated list of invoices in JSON format with the HTTP status 200
  def index
    @invoices = apply_scopes(Invoice).all.page(params[:p]).per(5)
  end
  
  # GET /invoices/:id
  #
  # Renders the view for a specific invoice.
  #
  # @note This method finds and sets the @invoice instance variable using the params[:id].
  #
  #  @return [HTML] Renders the view for the invoice.
  def show
  end
  
  # GET /invoices/:id 
  #
  # Renders a form to create a new invoice.
  #
  # @note This method is responsible for rendering the form to create a new invoice.
  # @return [HTML] The HTML form to create a new invoice.
  def new
    @invoice = Invoice.new
  end

  # GET /download_pdf/:id
  #
  # Calls the `downloads_invoice_pdf` module that downloads the PDF with the data of current invoice.
  #
  # @note This method finds and sets the @invoice instance variable using the params[:id].
  #
  # @return [void]
  def download_pdf
    download_invoice_pdf(@invoice)
  end

  # POST /invoices
  #
  # Creates a new invoice
  #
  # @option invoice_params [Integer] :invoice_number The number to identify the invoice for the company
  # @option invoice_params [String] :invoice_date The date of the invoice
  # @option invoice_params [String] :emmiter_company The company that emits the invoice
  # @option invoice_params [String] :charged_company The company that has to pay for the invoice
  # @option invoice_params [Decimal] :invoice_value The price to be paid for the invoice
  # @option invoice_params [String] :emails A string of emails separeted by commas
  #
  # @return [JSON] The new invoice created in JSON format with the HTTP status 201
  # @return [JSON] Error message in JSON format with the HTTP status 422 if the request fails
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

  # GET /invoices/new_invoice_email
  #
  # This method renders the form for submitting the envoice to a new list of emails without any parameters.
  #
  # @note This method finds and sets the @invoice instance variable using the params[:id].
  #
  # @return [HTML] The new_invoice_email form view as HTML
  def new_invoice_email
  end

  # GET /invoices/sends_new_invoice_email
  #
  # Process form `new_invoice_email` submission, calls for `sends_invoice_email` module, and redirects to the show invoice page with a success message.
  #
  # @note This method finds and sets the @invoice instance variable using the params[:id].
  #
  # @option params [String] :emails The list of email addresses of the recipients of the invoice.
  #
  # @return [HTTP Redirect] Redirects to the show page with a success message if the email is sent successfully.
  def sends_new_invoice_email
    sends_invoice_email(@invoice, params[:emails])
    redirect_to invoice_url(@invoice), notice: t(".new_email_sent")
  end

  private

  # Finds an invoice based on the ID parameter.
  # This method is used as a before_action callback.
  #
  # @note This method finds and sets the @invoice instance variable using the params[:id].
  #
  # @option params [Integer] :id The method uses the `params[:id]` to find the invoice.
  #
  # @return [Invoice] The found invoice based on the id parameter.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Provides permitted pagination parameters for Kaminari pagination.
  #
  # @note This method extracts and permits 'page' and 'per_page' parameters from the request.
  #
  # @return [Hash] The permitted pagination parameters for Kaminari pagination.
  def paginate_params
    params.permit(:page, :per_page)
  end

  # Strong parameters definition for Invoice attributes.
  #
  # @note This method defines permitted parameters for an Invoice.
  #
  # @return [ActionController::Parameters] The permitted Invoice parameters.
  def invoice_params
    params.require(:invoice).permit(:invoice_number, :invoice_date, :emitter_company, :charged_company, :invoice_value, :emails)
  end
end
