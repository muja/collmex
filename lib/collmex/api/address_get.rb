# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Adressen

class Collmex::Api::AddressGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "ADDRESS_GET" },
  { name: :adress_nr, type: :integer },
  { name: :adress_typ, type: :integer },
  { name: :text, type: :string },
  { name: :faellig_zur_wiedervorlage, type: :integer },
  { name: :plz, type: :string },
  { name: :adressgruppe, type: :integer },
  { name: :nur_geaenderte, type: :integer },
  { name: :systemname, type: :string },
  { name: :ansprechpartner, type: :integer },
  ]
end
