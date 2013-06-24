# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Authentifizierung

class Collmex::Api::Login < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "LOGIN" },
  { name: :benutzer, type: :string },
  { name: :passwort, type: :string },
  ]
end
