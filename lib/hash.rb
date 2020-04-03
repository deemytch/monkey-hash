class Hash

  def add_keysym_from(h)
    h.each{|k,v| self[ k.to_sym ] = v }
    self
  end
  def present?; ! self.empty?; end

  def symbolize_keys
    z = {}
    self.each do |k,v|
      z[ k.is_a?(String) ? k.to_sym : k ] = 
          case v
          when Hash then v.symbolize_keys
          when Array then v.symbolize_hashes
          else
            Marshal.load(Marshal.dump(v))
          end
    end
    z
  end

  def deep_merge(src)
    dst = dup
    dst.merge(src){|k, o1, o2|
      if o1.is_a?(o2.class) && o1.respond_to?(:deep_merge)
        o1.deep_merge(o2)
      else # classes mismatch or simple type
        o2.dup
      end
    }
  end

  def keys?(*list)
    keys.include?(*list)
  end

  def any_key?(*list)
    (( self.keys & list ).count > 0 ) && !! ( self.keys & list )
  end

  def filter_keys( *kk )
    filter{ |k, v| kk.include?(k) }
  end

end
