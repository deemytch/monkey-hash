# тестирование перегруженных операторов
RSpec.describe Array do
  it 'старое поведение include? сохраняется' do
    expect( [:a, :b, :c, :d].include? :d ).to eq true
    expect( [:a, :b, :c, :d].include? 'd' ).to eq false
  end
  it 'новое поведение для проверки списков на включение' do
    expect( [:a, :b, :c, :d].include? :d, :a ).to eq true
    expect( [:a, :b, :c, :d].include? 'd', :a ).to eq false
  end
  it 'оператор present? проверяет непустой массив' do
    expect( [:a, :b].present? ).to eq true
    expect( [].present? ).to eq false
  end
end
