# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Periodische_rechnung

class Collmex::Api::AboGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "ABO_GET" },
      { name: :kunde_nr, type: :integer },
      { name: :firma_nr, type: :integer },
      { name: :produkt_nr, type: :string },
      { name: :naechste_rechnung_von, type: :date },
      { name: :naechste_rechnung_bis, type: :date },
      { name: :nur_aktuell_gueltige, type: :integer },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
    ]
  end
end
