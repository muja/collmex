# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Angebote

class Collmex::Api::QuotationGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "QUOTATION_GET" },
      { name: :angebotsnummer, type: :string },
      { name: :firma_nr, type: :integer },
      { name: :kunde_nr, type: :integer },
      { name: :angebotsdatum_von, type: :date },
      { name: :angebotsdatum_bis, type: :date },
      { name: :briefpapier_nicht_verwenden, type: :integer },
      { name: :rueckgabe_format, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
    ]
  end
end
