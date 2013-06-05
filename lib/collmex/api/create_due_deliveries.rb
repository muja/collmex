# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Faellige_Lieferungen

class Collmex::Api::CreateDueDeliveries < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CREATE_DUE_DELIVERIES" },
      { name: :firma_nr, type: :integer },
      { name: :kunde_nr, type: :integer },
      { name: :liefertermin_bis, type: :date },
      { name: :nur_wenn_bestand_verfuegbar, type: :integer },
      { name: :warenausgang_buchen, type: :integer },
      { name: :auftragsnummer, type: :integer },
    ]
  end
end
