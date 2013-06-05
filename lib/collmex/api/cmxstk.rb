# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_bestand

class Collmex::Api::Cmxstk < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXSTK" },
      { name: :produktnummer, type: :string },
      { name: :firma, type: :integer },
      { name: :menge, type: :integer },
      { name: :bestandstyp, type: :integer },
      { name: :chargennummer, type: :integer },
      { name: :wert, type: :currency },
    ]
  end
end
