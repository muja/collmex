class String
  def symbolize
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    downcase.
    gsub(/[\- \/]+/, "_"). # "Foo-/bar tar" -> "foo__bar_tar"
    gsub("ö", "oe").gsub("ä", "ae").gsub("ü", "ue").gsub("ß", "ss").
    gsub(/\(.*?\)/, ''). # waehrung_(iso_codes) => waehrung_
    gsub(/(:|\.)+/, '_'). # foo::bar => foo_bar
    gsub(/__+/, '_'). # foo____bar => foo_bar
    gsub(/_$/, '') # foo_ => foo
  end

  def camelize
    s = gsub(/[\-_\s]+(\w)/){$1.capitalize}
    s[0] = s[0].upcase
    s
  end

  def classify
    camelize
  end

end

class Array
  def without *a
    self - a.flatten
  end
end
