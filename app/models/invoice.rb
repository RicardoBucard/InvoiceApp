# == Schema Information
#
# Table name: invoices
#
#  id              :integer          not null, primary key
#  charged_company :string
#  emails          :string
#  emitter_company :string
#  invoice_date    :string
#  invoice_number  :integer
#  invoice_value   :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Invoice < ApplicationRecord
  validates_presence_of :invoice_number, :invoice_date, :emitter_company, :charged_company, :invoice_value, :emails
  validates_uniqueness_of :invoice_number
  validates :invoice_number, :invoice_value, numericality: { only_integer: true, greater_than: 0 }
  validates :invoice_date, presence: true, format: { with: /\A(\d{2})\/(\d{2})\/(\d{4})\z/, message: "Invalid date format" }

  scope :filter_invoice_date, ->(query) { where(invoice_date: query) }
  scope :filter_invoice_number, ->(query) { where(invoice_number: query) }
end
