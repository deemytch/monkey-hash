class Hash

  def method_missing( m, *args )
    # return super if superclass.respond_to?(m)
    if m.to_s[-1] == '?'
      n = m.to_s[0..-2]
      return( self.key?(n) || self.key?(n.to_sym) )
    end
    self[m.to_s] || self[m]
  end

  def symbolize_keys
    z = {}
    self.each do |k,v|
      z[ k.is_a?(String) ? k.to_sym : k ] =
          if v.class == Hash
            v.symbolize_keys
          elsif v.respond_to?(:to_hash)
            v.to_hash.symbolize_keys
          elsif v.respond_to?(:collect)
            v.collect{|i| i.respond_to?(:symbolize_keys) ? i.symbolize_keys : i }
          else
            v.dup
          end
    end
    z
  end

end

s0 = {
        "a" => 1,
        "b" => '2',
        "c" => { "host" => "localhost", "port" => 8080, "threads" => 4 }
      }
puts s0.c.host == 'localhost'

puts "--------"

  s1 = {
        'a' => [ 1, '234a', :abcde, { "bcedr" => :beceder, nono: "memem", "lala" => { "lala" => 123, "totototo" => %r/^[^"]/, /^\w+/ => [ :a, :b, {} ] }, :more => 0.1154 } ],
        {} => {}, [] => {}, {} => [[]],
        'gluck' => { "host" => "localhost", port: 8080 },
        53 => :dhcpd
      }
puts s1.a[3].lala[ %r(^\w+) ][2] == {}
puts s1.gluck.host?



