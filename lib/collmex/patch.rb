module CmxinvPatch
  def offen?
    status == 20
  end

  def zu_buchen?
    status == 10
  end

  def neu?
    status == 0
  end

  specification.find{|x| x[:name] == :adressgruppe}[:type] = :int_arr
end

Cmxinv.send(:include, CmxinvPatch)