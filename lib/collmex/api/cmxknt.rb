# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_kontakte

class Collmex::Api::Cmxknt < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXKNT" },
      { name: :adressnummer, type: :integer },
      { name: :name, type: :string },
      { name: :adresstyp, type: :integer },
      { name: :kontaktnummer, type: :integer },
      { name: :datum, type: :date },
      { name: :uhrzeit, type: :string },
      { name: :typ, type: :integer },
      { name: :beschreibung, type: :string },
      { name: :angelegt_von, type: :string },
    ]
  end
end
