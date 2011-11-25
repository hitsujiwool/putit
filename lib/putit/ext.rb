class Pathname
  def ascendant_of?(pathname)
    flag = false
    clean = cleanpath
    pathname.cleanpath.ascend do |v|
      flag = true if v == clean     
    end
    flag
  end
end
