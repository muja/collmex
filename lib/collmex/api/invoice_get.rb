# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Rechnungen

class Collmex::Api::InvoiceGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "INVOICE_GET" },
      { name: :rechnungsnummer, type: :string },
      { name: :firma_nr, type: :integer },
      { name: :kunde_nr, type: :integer },
      { name: :rechnungsdatum_von, type: :date },
      { name: :rechnungsdatum_bis, type: :date },
      { name: :nur_ausgegebene, type: :integer },
      { name: :rueckgabe_format, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
      { name: :nur_vom_system_angelegte, type: :integer },
      { name: :briefpapier_nicht_verwenden, type: :integer },
    ]
  end
end
