# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Kunden

class Collmex::Api::CustomerGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "CUSTOMER_GET" },
  { name: :kunde_nr, type: :integer },
  { name: :firma_nr, type: :integer },
  { name: :text, type: :string },
  { name: :faellig_zur_wiedervorlage, type: :integer },
  { name: :plz, type: :string },
  { name: :adressgruppe, type: :integer },
  { name: :preisgruppe, type: :integer },
  { name: :rabattgruppe, type: :integer },
  { name: :vermittler, type: :integer },
  { name: :nur_geaenderte, type: :integer },
  { name: :systemname, type: :string },
  { name: :inaktive, type: :integer },
  ]
end
