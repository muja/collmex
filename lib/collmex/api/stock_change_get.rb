# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Bestandsaenderungen

class Collmex::Api::StockChangeGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "STOCK_CHANGE_GET" },
      { name: :firma_nr, type: :integer },
      { name: :produktnummer, type: :string },
      { name: :datum_von, type: :date },
      { name: :datum_bis, type: :date },
      { name: :kunde_nr, type: :integer },
      { name: :lieferant_nr, type: :integer },
      { name: :stornos, type: :integer },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
    ]
  end
end
