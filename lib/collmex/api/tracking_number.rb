# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_sendungsnummer

class Collmex::Api::TrackingNumber < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "TRACKING_NUMBER" },
  { name: :lieferung_nr, type: :integer },
  { name: :sendungs_nr, type: :string },
  ]
end
