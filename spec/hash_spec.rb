# тестирование перегруженных операторов
RSpec.describe Hash do
  it 'старое поведение key? сохраняется' do
    expect( { a: '', b: '', c: '', d: '' }.key? :d ).to be_truthy
    expect( { a: '', b: '', c: '', d: '' }.key? 'd' ).to be_falsy
  end
  it 'проверка наличия ключей' do
    expect( { a: '', b: '', c: '', d: '' }.keys? :d, :a ).to be_truthy
    expect( { a: '', b: '', c: '', d: '' }.keys? 'd', :a ).to be_falsy
    expect( { a: '', b: '', c: '', d: '' }.any_key?( :d, 'a', :c )).to be_truthy
  end
  it 'рекурсивное преобразование ключей в символы' do
    expect({
      "a" => 1,
      "b" => '2',
      "c" => { "host" => "localhost", "port" => 8080, "threads" => 4 }
    }.keys_to_symbols ).to eq({
      :a => 1,
      :b => '2',
      :c => { :host => "localhost", :port => 8080, :threads => 4 }
    })
  end
  it 'преобразование ключей сложного хеша в символы' do
    expect(
      {
        'a' => [ 1, '234a', :abcde, { "bcedr" => :beceder, nono: "memem", "lala" => { "lala" => 123, "totototo" => %r/^[^"]/, /^\w+/ => [ :a, :b, {} ] }, :more => 0.1154 } ],
        {} => {}, [] => {}, {} => [[]],
        'gluck' => { "host" => "localhost", port: 8080 },
        53 => :dhcpd
      }.keys_to_symbols
    ).to eq ({
      :a => [ 1, '234a', :abcde, { :bcedr => :beceder, nono: "memem", :lala => { :lala => 123, :totototo => %r/^[^"]/, /^\w+/ => [ :a, :b, {} ] }, more: 0.1154 } ],
      {} => {}, [] => {}, {} => [[]],
      :gluck => { :host => "localhost", port: 8080 },
      53 => :dhcpd
    })
  end
  it 'нотация с точкой' do
    h = {
        'a' => [ 1, '234a', :abcde, { "bcedr" => :beceder, nono: "memem", "lala" => { "lala" => 123, "totototo" => %r/^[^"]/, /^\w+/ => [ :a, :b, {} ] }, :more => 0.1154 } ],
        {} => {}, [] => {}, {} => [[]],
        'gluck' => { "host" => "localhost", port: 8080 },
        53 => :dhcpd
      }
    expect( h.a[3].lala[ %r(^\w+) ][2] ).to eq({})
    expect( h.gluck.host? ).to be_truthy
  end
end
