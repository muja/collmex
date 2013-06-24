# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Preisgruppen

class Collmex::Api::PriceGroupsGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "PRICE_GROUPS_GET" },
  { name: :firma_nr, type: :integer },
  ]
end
