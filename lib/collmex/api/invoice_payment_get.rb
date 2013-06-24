# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Zahlungen

class Collmex::Api::InvoicePaymentGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "INVOICE_PAYMENT_GET" },
  { name: :firma_nr, type: :integer },
  { name: :rechnungsnummer, type: :string },
  { name: :nur_neue_zahlungen, type: :integer },
  { name: :systemname, type: :string },
  ]
end
