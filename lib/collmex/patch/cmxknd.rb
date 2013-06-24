patch 'Cmxknd', 'CustomerGet' do
  adressgruppe[:type] = :int_arr
end

patch 'Cmxknd' do
  firma_nr[:required] = true
end