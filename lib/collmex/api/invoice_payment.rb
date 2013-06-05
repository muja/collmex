# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Zahlungen

class Collmex::Api::InvoicePayment < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "INVOICE_PAYMENT" },
      { name: :rechnungsnummer, type: :string },
      { name: :datum, type: :date },
      { name: :gezahlter_betrag, type: :currency },
      { name: :reduzierender_betrag, type: :currency },
      { name: :geschaeftsjahr, type: :integer },
      { name: :beleg_nr, type: :integer },
      { name: :beleg_pos, type: :integer },
    ]
  end
end
