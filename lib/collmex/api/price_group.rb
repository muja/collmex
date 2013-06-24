# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Preisgruppen

class Collmex::Api::PriceGroup < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "PRICE_GROUP" },
  { name: :firma_nr, type: :integer },
  { name: :nr, type: :integer },
  { name: :bezeichnung, type: :string },
  { name: :bruttopreise, type: :integer },
  { name: :waehrung, type: :string },
  ]
end
