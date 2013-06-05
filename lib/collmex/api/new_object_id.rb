# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_nummernvergabe

class Collmex::Api::NewObjectId < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "NEW_OBJECT_ID" },
      { name: :neue_nummer, type: :integer },
      { name: :temporaere_nummer, type: :integer },
      { name: :zeile, type: :integer },
    ]
  end
end
