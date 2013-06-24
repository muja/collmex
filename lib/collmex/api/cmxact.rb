# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_taetigkeiten

class Collmex::Api::Cmxact < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "CMXACT" },
  { name: :projekt_nr, type: :integer },
  { name: :mitarbeiter_nr, type: :integer },
  { name: :firma_nr, type: :integer },
  { name: :satz_nr, type: :integer },
  { name: :beschreibung, type: :string },
  { name: :datum, type: :date },
  { name: :von, type: :string },
  { name: :bis, type: :string },
  { name: :pausen, type: :string },
  ]
end
