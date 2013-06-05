# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_adressen

class Collmex::Api::Cmxadr < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXADR" },
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
      { name: :bemerkung, type: :string },
      { name: :inaktiv, type: :integer },
      { name: :land, type: :string },
      { name: :telefon, type: :string },
      { name: :telefax, type: :string },
      { name: :e_mail, type: :string },
      { name: :kontonr, type: :string },
      { name: :blz, type: :string },
      { name: :iban, type: :string },
      { name: :bic, type: :string },
      { name: :bankname, type: :string },
      { name: :steuernummer, type: :string },
      { name: :u_st_id_nr, type: :string },
      { name: :reserviert, type: :string },
      { name: :telefon2, type: :string },
      { name: :skype_vo_ip, type: :string },
      { name: :url, type: :string },
      { name: :kontoinhaber, type: :string },
      { name: :wiedervorlage, type: :date },
      { name: :adressgruppe, type: :integer },
      { name: :vermittler, type: :integer },
      { name: :firma_nr, type: :integer },
    ]
  end
end
