# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Kundenauftraege

class Collmex::Api::SalesOrderGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "SALES_ORDER_GET" },
      { name: :auftragsnummer, type: :string },
      { name: :firma_nr, type: :integer },
      { name: :kunde_nr, type: :integer },
      { name: :auftragsdatum_von, type: :date },
      { name: :auftragsdatum_bis, type: :date },
      { name: :auftragsnummer_bei_kunde, type: :string },
      { name: :rueckgabe_format, type: :string },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
      { name: :nur_vom_system_angelegte, type: :integer },
      { name: :briefpapier_nicht_verwenden, type: :integer },
    ]
  end
end
