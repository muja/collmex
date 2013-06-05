# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_lieferant

class Collmex::Api::Cmxlif < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXLIF" },
      { name: :lieferantennummer, type: :integer },
      { name: :firma_nr, type: :integer },
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
      { name: :zahlungsbedingung, type: :integer },
      { name: :lieferbedingung, type: :string },
      { name: :lieferbedingung_zusatz, type: :string },
      { name: :ausgabemedium, type: :integer },
      { name: :kontoinhaber, type: :string },
      { name: :adressgruppe, type: :integer },
      { name: :kundennummer_beim_lieferanten, type: :string },
      { name: :waehrung, type: :string },
      { name: :telefon2, type: :string },
      { name: :ausgabesprache, type: :integer },
    ]
  end
end
