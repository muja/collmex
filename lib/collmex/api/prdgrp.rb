# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_produktgruppen

class Collmex::Api::Prdgrp < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "PRDGRP" },
  { name: :produktgruppe_nr, type: :integer },
  { name: :bezeichnung, type: :string },
  { name: :untergruppe_von, type: :integer },
  ]
end
