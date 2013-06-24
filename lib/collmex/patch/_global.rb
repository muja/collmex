patch '*' do
  kunde_nr[:name] = :kundennummer
end

patch '*' do
  kunden_nr[:name] = :kundennummer
end

patch '*' do
  firma_nr[:default] = 1
end