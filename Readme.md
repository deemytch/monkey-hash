# Different utils

Patching standard classes: Hash, Array, String, Nil, Numeric, Object and Thread.

## Hash

    present? == empty?

    symbolize_keys
    # Transform keys recursive String => Symbol
    
    deep_merge( Hash )

    keys?( *list )
    # All keys from list must be present

    any_key?( *list )
    # At least one key from list must be present

    filter_keys( *list )

Also here's simple id generator based on current time `AMQProto#correlation_id`.
