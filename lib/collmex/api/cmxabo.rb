# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_periodische_rechnung

class Collmex::Api::Cmxabo < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXABO" },
      { name: :kunden_nr, type: :integer },
      { name: :firma, type: :integer },
      { name: :gueltig_von, type: :date },
      { name: :gueltig_bis, type: :date },
      { name: :produkt_nr, type: :string },
      { name: :produktbeschreibung, type: :string },
      { name: :individueller_preis, type: :currency },
      { name: :intervall, type: :integer },
      { name: :naechste_rechnung, type: :date },
    ]
  end
end
