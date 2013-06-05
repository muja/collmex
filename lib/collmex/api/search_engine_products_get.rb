# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Suchmaschinen

class Collmex::Api::SearchEngineProductsGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "SEARCH_ENGINE_PRODUCTS_GET" },
      { name: :webauftritt_nr, type: :integer },
      { name: :export_format, type: :integer },
    ]
  end
end
