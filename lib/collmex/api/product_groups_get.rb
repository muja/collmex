# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Produktgruppen

class Collmex::Api::ProductGroupsGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "PRODUCT_GROUPS_GET" },
    ]
  end
end
