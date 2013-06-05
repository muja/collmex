# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Salden

class Collmex::Api::Accbal < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "ACCBAL" },
      { name: :kontonummer, type: :integer },
      { name: :kontoname, type: :string },
      { name: :saldo, type: :currency },
    ]
  end
end
