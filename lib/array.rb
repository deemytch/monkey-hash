class Array
  alias :super_include? :include?
  alias :present? :any?

  def include?(*list)
    list.count == 1 ? super_include?(list.first) : ( self & list ).count == list.count
  end

  def symbolize_hashes
    z = []
    self.each do |i|
      z << case i
        when Array then i.symbolize_hashes
        when Hash then i.symbolize_keys
        else
          Marshal.load(Marshal.dump(i))
        end
    end
    return z
  end
end
