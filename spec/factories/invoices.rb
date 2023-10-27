FactoryBot.define do
  factory :valid_invoice, class: Invoice do
    invoice_number { 1 }
    invoice_date { "26/10/2023" }
    emitter_company { "MyString" }
    charged_company { "MyString" }
    invoice_value { 9.99 }
    emails { "abc@testmail.com,cba@testmail.com" }
  end
  factory :invalid_invoice, class: Invoice do
    invoice_number { '' }
    invoice_date { "2023-10-26" }
    emitter_company { "" }
    charged_company { "" }
    invoice_value { "" }
    emails { "" }
  end
end
