# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_rechnungen

class Collmex::Api::Cmxinv < Collmex::Api::Line
  # Rechnungsart
  RECHNUNG = 0
  GUTSCHRIFT = 1
  ABSCHLAGSRECHNUNG = 2
  BARVERKAUF = 3
  RETOURENGUTSCHRIFT = 4
  PROFORMARECHNUNG = 5

  # Produktart
  WARE = 0
  DIENSTLEISTUNG = 1
  MITGLIEDSBEITRAG = 2
  BAUDIENSTLEISTUNG = 3

  # Steuerklassifikation
  VOLLER_STEUERSATZ = 0
  HALBER_STEUERSATZ = 1
  STEUERFREI = 2

  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXINV" },
      { name: :rechnungsnummer, type: :integer },
      { name: :position, type: :integer },
      { name: :rechnungsart, type: :integer },
      { name: :firma_nr, type: :integer },
      { name: :auftrag_nr, type: :integer },
      { name: :kunden_nr, type: :integer },
      { name: :kunde_anrede, type: :string },
      { name: :kunde_titel, type: :string },
      { name: :kunde_vorname, type: :string },
      { name: :kunde_name, type: :string },
      { name: :kunde_firma, type: :string },
      { name: :kunde_abteilung, type: :string },
      { name: :kunde_strasse, type: :string },
      { name: :kunde_plz, type: :string },
      { name: :kunde_ort, type: :string },
      { name: :kunde_land, type: :string },
      { name: :kunde_telefon, type: :string },
      { name: :kunde_telefon2, type: :string },
      { name: :kunde_telefax, type: :string },
      { name: :kunde_e_mail, type: :string },
      { name: :kunde_kontonr, type: :string },
      { name: :kunde_blz, type: :string },
      { name: :kunde_abweichender_kontoinhaber, type: :string },
      { name: :kunde_iban, type: :string },
      { name: :kunde_bic, type: :string },
      { name: :kunde_bank, type: :string },
      { name: :kunde_u_st_id_nr, type: :string },
      { name: :reserviert, type: :integer },
      { name: :rechnungsdatum, type: :date },
      { name: :preisdatum, type: :date },
      { name: :zahlungsbedingung, type: :integer },
      { name: :waehrung, type: :string },
      { name: :preisgruppe, type: :integer },
      { name: :rabattgruppe, type: :integer },
      { name: :schluss_rabatt, type: :integer },
      { name: :rabattgrund, type: :string },
      { name: :rechnungstext, type: :string },
      { name: :schlusstext, type: :string },
      { name: :internes_memo, type: :string },
      { name: :geloescht, type: :integer },
      { name: :sprache, type: :integer },
      { name: :bearbeiter, type: :integer },
      { name: :vermittler, type: :integer },
      { name: :systemname, type: :string },
      { name: :status, type: :integer },
      { name: :schluss_rabatt_2, type: :currency },
      { name: :schluss_rabatt_2_grund, type: :string },
      { name: :versandart, type: :integer },
      { name: :versandkosten, type: :currency },
      { name: :nachnahmegebuehr, type: :currency },
      { name: :liefer_leistungsdatum, type: :date },
      { name: :lieferbedingung, type: :string },
      { name: :lieferbedingung_zusatz, type: :string },
      { name: :liefer_adr_anrede, type: :string },
      { name: :liefer_adr_titel, type: :string },
      { name: :liefer_adr_vorname, type: :string },
      { name: :liefer_adr_name, type: :string },
      { name: :liefer_adr_firma, type: :string },
      { name: :liefer_adr_abteilung, type: :string },
      { name: :liefer_adr_strasse, type: :string },
      { name: :liefer_adr_plz, type: :string },
      { name: :liefer_adr_ort, type: :string },
      { name: :liefer_adr_land, type: :string },
      { name: :liefer_adr_telefon, type: :string },
      { name: :liefer_adr_telefon2, type: :string },
      { name: :liefer_adr_telefax, type: :string },
      { name: :liefer_adr_e_mail, type: :string },
      { name: :positionstyp, type: :integer },
      { name: :produktnummer, type: :string },
      { name: :produktbeschreibung, type: :string },
      { name: :mengeneinheit, type: :string },
      { name: :menge, type: :integer },
      { name: :einzelpreis, type: :currency },
      { name: :preismenge, type: :integer },
      { name: :positionsrabatt, type: :currency },
      { name: :positionswert, type: :currency },
      { name: :produktart, type: :integer },
      { name: :steuerklassifikation, type: :integer },
      { name: :steuer_auch_im_ausland, type: :integer },
      { name: :kundenauftragsposition, type: :integer },
      { name: :erloesart, type: :integer },
      { name: :summe_ueber_pos, type: :integer },
    ]
  end
end
