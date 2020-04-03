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
end
