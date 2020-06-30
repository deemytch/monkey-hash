# Various utils

Patching standard classes: Hash, Array, String, Nil, Numeric, Object and Thread.
This gem is supported thanks to pro.ruby community ( https://t.me/pro_rb ).

## Hash

    present? == empty?

    symbolize_keys
    # Transform keys *recursive* String => Symbol

    deep_merge( Hash )

    keys?( *list )
    # All keys from list must be present

    any_key?( *list )
    # At least one key from list must be present

    filter_keys( *list )

`hash.key.otherkey.more` notation, also `hash.key?` returns true/false, also `hash.key1.key2 = value` works, even if `key2` not exists.

Also here's simple id generator based on current time `AMQProto#correlation_id`.

## Object

    present? != nil

## String

    like_number?
    # regexp determining is that Float or Numeric

    present? != empty?

    from_json
    # JSON with rescue to {}

    from_yaml
    # YAML with rescue to {}

    from_msgpack
    # MsgPack with rescue to {}

    from_zlib
    # Zlib with rescue to {}

    to_a
    # => [self]

    snakecase()

    camelcase()

## Array

    include?(*list)
    # must include all elements from list

    include_one?( *list )
    # must include at least one item from list

    symbolize_hashes
    # Additional for Hash#symbolize_keys

## AMQProto

    correlation_id() # => String

## Numeric

    present? # == always true

    to_a # [ self ]

## Thread

    wait_for_key( k, tmout )
    # Waith for thread-local variable returning `false` after timeout and `true` before timeout
    # So, if variable was set, this function will return true

## Nil

    empty? == true

    present? == false

    dig(*args) == self

    to_a == []

    call(*args) == self

## Proc

    _dump_data == to_s
