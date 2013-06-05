# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Buchhaltungsbelege

class Collmex::Api::AccdocGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "ACCDOC_GET" },
      { name: :firma_nr, type: :integer },
      { name: :geschaeftsjahr, type: :integer },
      { name: :nr, type: :integer },
      { name: :konto_nr, type: :integer },
      { name: :kostenstelle, type: :integer },
      { name: :kundennummer, type: :integer },
      { name: :lieferantennummer, type: :integer },
      { name: :anlagenummer, type: :integer },
      { name: :rechnungsnummer, type: :integer },
      { name: :reisenummer, type: :integer },
      { name: :text, type: :string },
      { name: :belegdatum_von, type: :date },
      { name: :belegdatum_bis, type: :date },
      { name: :stornos, type: :integer },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
    ]
  end
end
