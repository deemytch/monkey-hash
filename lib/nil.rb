class NilClass
  def empty?; true; end
  def present?; false; end
  def dig(*args); self; end
  def call(*args); self; end
end
