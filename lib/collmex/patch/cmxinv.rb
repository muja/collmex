patch 'Cmxinv' do
  menge[:default] = 1
  kundennummer[:required] = true

  NEU = 0
  ZU_BUCHEN = 10
  OFFEN = 20

  def neu?
    status == NEU
  end

  def zu_buchen?
    status == ZU_BUCHEN
  end

  def offen?
    status == OFFEN
  end
end