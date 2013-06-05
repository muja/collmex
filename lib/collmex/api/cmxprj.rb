# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Projekte

class Collmex::Api::Cmxprj < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXPRJ" },
      { name: :projektnummer, type: :integer },
      { name: :firma_nr, type: :integer },
      { name: :bezeichnung, type: :string },
      { name: :kunde_nr, type: :integer },
      { name: :name_des_kunden, type: :string },
      { name: :abgeschlossen, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :reserviert, type: :integer },
      { name: :satz_nr, type: :integer },
      { name: :bezeichnung, type: :string },
      { name: :produktnummer, type: :string },
      { name: :satz, type: :currency },
      { name: :waehrung, type: :string },
      { name: :mengeneinheit, type: :string },
      { name: :inaktiv, type: :integer },
    ]
  end
end
