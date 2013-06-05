# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Lieferantenauftraege

class Collmex::Api::PurchaseOrderGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "PURCHASE_ORDER_GET" },
      { name: :lieferantenauftragsnummer, type: :string },
      { name: :firma_nr, type: :integer },
      { name: :lieferant_nr, type: :integer },
      { name: :produktnummer, type: :string },
      { name: :nur_ausgegebene, type: :integer },
      { name: :rueckgabe_format, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
      { name: :briefpapier_nicht_verwenden, type: :integer },
    ]
  end
end
