# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Produkte

class Collmex::Api::ProductGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "PRODUCT_GET" },
      { name: :firma_nr, type: :integer },
      { name: :produktnummer, type: :string },
      { name: :produktgruppe, type: :integer },
      { name: :preisgruppe, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
      { name: :webauftritt_nr, type: :integer },
    ]
  end
end
