# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Verfuegbarkeit

class Collmex::Api::StockAvailableGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "STOCK_AVAILABLE_GET" },
  { name: :firma_nr, type: :integer },
  { name: :produktnummer, type: :string },
  { name: :nur_geaenderte, type: :integer },
  { name: :systemname, type: :string },
  ]
end
