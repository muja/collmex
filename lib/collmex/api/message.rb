# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Rueckmeldungen

class Collmex::Api::Message < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "MESSAGE" },
  { name: :meldungstyp, type: :string },
  { name: :meldungsnummer, type: :string },
  { name: :meldungstext, type: :string },
  { name: :zeile, type: :integer },
  ]
end
