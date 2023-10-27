require 'rails_helper'

RSpec.describe Invoice, type: :model do  
  context 'When Invoice is valid' do
    let(:invoice) { build(:valid_invoice) }
    it do
      should validate_uniqueness_of(:invoice_number)
      should validate_presence_of(:invoice_number)
      should validate_presence_of(:invoice_date)
      should validate_presence_of(:emitter_company)
      should validate_presence_of(:charged_company)
      should validate_presence_of(:invoice_value)
      should validate_presence_of(:emails)
      should allow_value(invoice.invoice_date).for(:invoice_date)
    end
  end

  context 'When Invoice is invalid' do
    let(:invoice) { build(:invalid_invoice) }
    it do
      should_not be_valid(invoice)
      should_not allow_value(invoice.invoice_date).for(:invoice_date)
    end
  end
end
