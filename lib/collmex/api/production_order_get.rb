# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Produktionsauftraege

class Collmex::Api::ProductionOrderGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "PRODUCTION_ORDER_GET" },
  { name: :produktionsauftragsnummer, type: :string },
  { name: :standort_nr, type: :integer },
  { name: :produktnummer, type: :string },
  { name: :komponente, type: :string },
  { name: :offene, type: :integer },
  { name: :datum, type: :date },
  { name: :nur_geaenderte, type: :integer },
  { name: :systemname, type: :string },
  ]
end
