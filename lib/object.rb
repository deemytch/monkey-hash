class Object
  def present?
    ! nil?
  end
  def to_a
    [ self ]
  end

  # stolen from activesupport core extensions
  def try( method_name = nil, *args, &b )
    if method_name.nil? && block_given?
      b.arity == 0 ? instance_eval( &b ) : yield( self )
    elsif respond_to?( method_name )
      public_send( method_name, *args, &b )
    end
  end
end
