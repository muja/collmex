# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_preise

class Collmex::Api::Cmxpri < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXPRI" },
      { name: :produktnummer, type: :string },
      { name: :firma, type: :integer },
      { name: :preisgruppe, type: :integer },
      { name: :gueltig_ab, type: :date },
      { name: :gueltig_bis, type: :date },
      { name: :preis, type: :currency },
    ]
  end
end
