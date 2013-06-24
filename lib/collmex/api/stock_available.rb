# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Verfuegbarkeit

class Collmex::Api::StockAvailable < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "STOCK_AVAILABLE" },
  { name: :produktnummer, type: :string },
  { name: :firma_nr, type: :integer },
  { name: :verfuegbarer_bestand, type: :integer },
  { name: :mengeneinheit, type: :string },
  { name: :wiederbeschaffungszeit, type: :integer },
  ]
end
