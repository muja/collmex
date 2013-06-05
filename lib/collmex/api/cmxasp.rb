# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_anspr

class Collmex::Api::Cmxasp < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXASP" },
      { name: :adressnummer, type: :integer },
      { name: :adresstyp, type: :integer },
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
      { name: :keine_mailings, type: :integer },
      { name: :adressgruppe, type: :integer },
    ]
  end
end
