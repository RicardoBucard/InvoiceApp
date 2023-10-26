class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show ]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully created and sent to the informed emails" }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:invoice_number, :invoice_date, :emitter_company, :charged_company, :invoice_value, :emails)
    end
end
