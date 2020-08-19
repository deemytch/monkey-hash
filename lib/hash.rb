# frozen_string_literal: true
class Hash

  def add_keysym_from(h)
    h.each{|k,v| self[ k.to_sym ] = v }
    self
  end
  def present?; ! self.empty?; end

  def method_missing( m, *args )
    case m[-1]
    when '?'
      n = m[0..-2].to_sym
      self.key?(n) || self.key?(n.to_s)
    when '='
      self[ m[0..-2].to_sym ] = args.first
    else
      self[m] || self[m.to_s]
    end
  end

  def keys_to_symbols
    z = {}
    self.each do |k,v|
      z[ k.is_a?(String) ? k.to_sym : k ] =
          if v.class == Hash
            v.keys_to_symbols
          elsif v.respond_to?(:to_hash)
            v.to_hash.keys_to_symbols
          elsif v.respond_to?(:collect)
            v.collect{|i| i.respond_to?(:keys_to_symbols) ? i.keys_to_symbols : i }
          else
            v.dup
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

  # do not processes recursive Arrays
  def recursive_transform_values!(&block)
    transform_values! do |v|

      case v
      when Hash
        v.recursive_transform_values!( &block )
      when Enumerable
        v.map{|i| i.is_a?( Hash ) ? i.recursive_transform_values!( &block ) : yield( i ) }
      else
        yield( v )
      end

    end
  end

end
