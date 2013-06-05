# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_lohn

class Collmex::Api::Cmxprl < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart, type: :string, const: "CMXPRL" },
      { name: :firma_nr, type: :integer },
      { name: :jahr, type: :integer },
      { name: :monat, type: :integer },
      { name: :belegdatum, type: :date },
      { name: :belegtext, type: :string },
      { name: :betrag, type: :currency },
      { name: :soll_konto, type: :integer },
      { name: :haben_konto, type: :integer },
    ]
  end
end
