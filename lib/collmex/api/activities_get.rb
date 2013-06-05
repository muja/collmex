# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Taetigkeiten

class Collmex::Api::ActivitiesGet < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "ACTIVITIES_GET" },
      { name: :projekt_nr, type: :integer },
      { name: :firma_nr, type: :integer },
      { name: :mitarbeiter_nr, type: :integer },
      { name: :datum_von, type: :date },
      { name: :datum_bis, type: :date },
      { name: :nicht_berechnet, type: :integer },
      { name: :rechnungsrelevant, type: :integer },
      { name: :keine_internen_taetigkeiten, type: :integer },
      { name: :nur_geaenderte, type: :integer },
      { name: :systemname, type: :string },
    ]
  end
end
