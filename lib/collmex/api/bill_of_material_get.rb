# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Stuecklisten

class Collmex::Api::BillOfMaterialGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "BILL_OF_MATERIAL_GET" },
      { name: :firma_nr, type: :integer },
      { name: :produkt_nr, type: :string },
      { name: :verwendung, type: :integer },
      { name: :komponente_produkt_nr, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
    ]
  end
end
