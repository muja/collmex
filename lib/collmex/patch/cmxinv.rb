patch 'Cmxinv' do
  #self::NEU to have access from inside Cmxinv

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