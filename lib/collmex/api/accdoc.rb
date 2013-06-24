# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Buchhaltungsbelege

class Collmex::Api::Accdoc < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "ACCDOC" },
  { name: :firma_nr, type: :integer },
  { name: :geschaeftsjahr, type: :integer },
  { name: :belegnummer, type: :integer },
  { name: :belegdatum, type: :date },
  { name: :gebucht_am, type: :date },
  { name: :belegtext, type: :string },
  { name: :positionsnummer, type: :integer },
  { name: :kontonummer, type: :integer },
  { name: :kontoname, type: :string },
  { name: :soll_haben, type: :integer },
  { name: :betrag, type: :currency },
  { name: :kunde_nummer, type: :integer },
  { name: :kunde_name, type: :string },
  { name: :lieferant_nummer, type: :integer },
  { name: :lieferant_name, type: :string },
  { name: :anlage_nummer, type: :integer },
  { name: :anlage_name, type: :string },
  { name: :stornierter_beleg, type: :integer },
  { name: :kostenstelle, type: :string },
  { name: :rechnungsnummer, type: :string },
  { name: :kundenauftrag_nummer, type: :integer },
  { name: :reise_nummer, type: :integer },
  { name: :zugeordnet_nummer, type: :integer },
  { name: :zugeordnet_geschaeftsjahr, type: :integer },
  { name: :zugeordnet_positionsnummer, type: :integer },
  ]
end
