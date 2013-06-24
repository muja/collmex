# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_lieferantenrechnung

class Collmex::Api::Cmxlrn < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "CMXLRN" },
  { name: :lieferantennummer, type: :integer },
  { name: :firma_nr, type: :integer },
  { name: :rechnungsdatum, type: :date },
  { name: :rechnungsnummer, type: :string },
  { name: :nettobetrag_voller_umsatzsteuersatz, type: :currency },
  { name: :steuer_zum_vollen_umsatzsteuersatz, type: :currency },
  { name: :nettobetrag_halber_umsatzsteuersatz, type: :currency },
  { name: :steuer_zum_halben_umsatzsteuersatz, type: :currency },
  { name: :sonstige_umsaetze_konto_nr, type: :integer },
  { name: :sonstige_umsaetze_betrag, type: :currency },
  { name: :waehrung, type: :string },
  { name: :gegenkonto, type: :integer },
  { name: :gutschrift, type: :integer },
  { name: :belegtext, type: :string },
  { name: :zahlungsbedingung, type: :integer },
  { name: :konto_nr_voller_umsatzsteuersatz, type: :integer },
  { name: :konto_nr_halber_umsatzsteuersatz, type: :integer },
  { name: :storno, type: :integer },
  { name: :kostenstelle, type: :string },
  ]
end
