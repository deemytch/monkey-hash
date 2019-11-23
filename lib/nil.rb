class NilClass
  def empty?; true; end
  def present?; false; end
  def dig(*args); self; end
  def to_a; []; end
end
