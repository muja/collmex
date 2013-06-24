# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Adressgruppen

class Collmex::Api::AddressGroupsGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "ADDRESS_GROUPS_GET" },
  ]
end
