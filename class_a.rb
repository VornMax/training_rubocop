module C
  def about_lookup
    'from module C'
  end
end

class A
  # include C
  extend C
  # prepend C

  def about_lookup
    'from class A'
  end
end

class B < A
  def about_lookup
    'from class B'
  end
end

a1 = A.new
p a1.about_lookup
b1 = B.new
p b1.about_lookup
p A.about_lookup
p A.ancestors # [A, Object, Kernel, BasicObject]
