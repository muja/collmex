# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Salden

class Collmex::Api::AccbalGet < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "ACCBAL_GET" },
  { name: :firma_nr, type: :integer },
  { name: :geschaeftsjahr, type: :integer },
  { name: :datum_bis, type: :integer },
  { name: :konto_nr, type: :integer },
  { name: :kontengruppe, type: :integer },
  { name: :kunde_nr, type: :integer },
  { name: :lieferant_nr, type: :integer },
  ]
end
