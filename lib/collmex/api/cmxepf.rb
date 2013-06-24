# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_abw

class Collmex::Api::Cmxepf < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "CMXEPF" },
  { name: :kundennummer, type: :integer },
  { name: :firma_nr, type: :integer },
  { name: :dokument_typ, type: :integer },
  { name: :ausgabemedium, type: :integer },
  { name: :anrede, type: :string },
  { name: :titel, type: :string },
  { name: :vorname, type: :string },
  { name: :name, type: :string },
  { name: :firma, type: :string },
  { name: :abteilung, type: :string },
  { name: :strasse, type: :string },
  { name: :plz, type: :string },
  { name: :ort, type: :string },
  { name: :land, type: :string },
  { name: :telefon, type: :string },
  { name: :telefon2, type: :string },
  { name: :telefax, type: :string },
  { name: :skype_vo_ip, type: :string },
  { name: :e_mail, type: :string },
  { name: :bemerkung, type: :string },
  { name: :url, type: :string },
  { name: :keine_mailings, type: :string },
  { name: :adressgruppe, type: :integer },
  ]
end
