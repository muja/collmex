# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Projekte

class Collmex::Api::ProjectGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "PROJECT_GET" },
      { name: :projektnummer, type: :integer },
      { name: :firma_nr, type: :integer },
      { name: :kunde_nr, type: :integer },
    ]
  end
end
