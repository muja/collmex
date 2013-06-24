# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,daten_importieren_bestandsaenderungen

class Collmex::Api::StockChange < Collmex::Api::Line
  SPECIFICATION =
  [
  { name: :satzart, type: :string, const: "STOCK_CHANGE" },
  { name: :bestandsaenderung_nr, type: :integer },
  { name: :bestandsaenderung_pos, type: :integer },
  { name: :produktnummer, type: :string },
  { name: :bewegungsart, type: :integer },
  { name: :menge, type: :integer },
  { name: :ziel_standort_nr, type: :integer },
  { name: :ziel_bestandstyp, type: :integer },
  { name: :ziel_charge_nr, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :quell_standort_nr, type: :integer },
  { name: :quell_bestandstyp, type: :integer },
  { name: :quell_charge_nr, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :reserviert, type: :integer },
  { name: :lieferantenauftrag_nr, type: :integer },
  { name: :lieferantenauftrag_pos, type: :integer },
  { name: :lieferung_nr, type: :integer },
  { name: :lieferung_pos, type: :integer },
  { name: :produktionsauftrag_nr, type: :integer },
  { name: :produktionsauftrag_komp, type: :integer },
  { name: :rechnung_nr, type: :integer },
  { name: :rechnung_pos, type: :integer },
  { name: :storniert_nr, type: :integer },
  { name: :storniert_pos, type: :integer },
  { name: :memo, type: :string },
  { name: :gebucht_am, type: :date },
  { name: :gebucht_um, type: :string },
  ]
end
