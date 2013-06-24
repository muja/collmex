# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Stuecklisten

class Collmex::Api::Cmxbom < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "CMXBOM" },
  { name: :produktnummer, type: :string },
  { name: :firma_nr, type: :integer },
  { name: :version, type: :integer },
  { name: :verwendung, type: :integer },
  { name: :gueltig_ab, type: :date },
  { name: :text, type: :string },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :pos, type: :integer },
  { name: :produktnummer, type: :string },
  { name: :menge, type: :currency },
  { name: :bezugsmenge, type: :currency },
  ]
end
