# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_umsaetze

class Collmex::Api::Cmxums < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXUMS" },
      { name: :kundennummer, type: :integer },
      { name: :firma_nr, type: :integer },
      { name: :rechnungsdatum, type: :date },
      { name: :rechnungsnummer, type: :string },
      { name: :nettobetrag_voller_umsatzsteuersatz, type: :currency },
      { name: :steuer_zum_vollen_umsatzsteuersatz, type: :currency },
      { name: :nettobetrag_halber_umsatzsteuersatz, type: :currency },
      { name: :steuer_zum_halben_umsatzsteuersatz, type: :currency },
      { name: :umsaetze_innergemeinschaftliche_lieferung, type: :currency },
      { name: :umsaetze_export, type: :currency },
      { name: :steuerfreie_erloese_konto_nr, type: :integer },
      { name: :steuerfreie_erloese_betrag, type: :currency },
      { name: :waehrung, type: :string },
      { name: :gegenkonto, type: :integer },
      { name: :rechnungsart, type: :integer },
      { name: :belegtext, type: :string },
      { name: :zahlungsbedingung, type: :integer },
      { name: :konto_nr_voller_umsatzsteuersatz, type: :integer },
      { name: :konto_nr_halber_umsatzsteuersatz, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :storno, type: :integer },
      { name: :schlussrechnung, type: :string },
      { name: :erloesart, type: :integer },
      { name: :systemname, type: :string },
      { name: :verrechnen_mit_rechnungsnummer, type: :string },
      { name: :kostenstelle, type: :string },
    ]
  end
end
