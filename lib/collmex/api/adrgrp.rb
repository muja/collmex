# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_adressgruppen

class Collmex::Api::Adrgrp < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "ADRGRP" },
  { name: :adressgruppe_nr, type: :integer },
  { name: :bezeichnung, type: :string },
  ]
end
