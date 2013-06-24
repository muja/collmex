# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Lieferanten

class Collmex::Api::VendorGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "VENDOR_GET" },
  { name: :lieferanten_nr, type: :integer },
  { name: :firma_nr, type: :integer },
  { name: :text, type: :string },
  { name: :faellig_zur_wiedervorlage, type: :integer },
  { name: :plz, type: :string },
  { name: :nur_geaenderte, type: :integer },
  { name: :systemname, type: :string },
  ]
end
