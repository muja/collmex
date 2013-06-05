# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Lieferungen

class Collmex::Api::DeliveryGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "DELIVERY_GET" },
      { name: :lieferungsnummer, type: :string },
      { name: :firma_nr, type: :integer },
      { name: :kunde_nr, type: :integer },
      { name: :lieferdatum_von, type: :date },
      { name: :lieferdatum_bis, type: :date },
      { name: :nur_ausgegebene, type: :integer },
      { name: :rueckgabe_format, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
      { name: :briefpapier_nicht_verwenden, type: :integer },
      { name: :kundenauftrag_nr, type: :integer },
    ]
  end
end
