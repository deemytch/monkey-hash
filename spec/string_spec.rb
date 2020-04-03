RSpec.describe String do
  it 'like_number работает с реальными числами' do
    expect( 's'.like_number? ).to eq false
    expect( '0'.like_number? ).to eq true

    expect( '0.0'.like_number? ).to eq true
    expect( '0.a'.like_number? ).to eq false
    expect( '1500231123.akkjas'.like_number? ).to eq false
    expect( '-1500231123.0001'.like_number? ).to eq true
    expect( '-1500231123.ef001'.like_number? ).to eq false
    expect( '+1500231123.ef001'.like_number? ).to eq false
    expect( '+a500231123.001'.like_number? ).to eq false
    expect( '+0500231123.001'.like_number? ).to eq true
  end

  it 'like_number? умеет экспоненциальную форму' do
    expect( '+0.5e-10'.like_number? ).to eq true
    expect( '+0.5e+10'.like_number? ).to eq true
    expect( '+.5e+10'.like_number? ).to eq true

    expect( '+0.5e+1a'.like_number? ).to eq false
  end

  it 'from_json возвращает пустой хэш, если что' do
    expect( 'o'.from_json ).to eq ({})
    expect( '{}'.from_json ).to eq ({})
    expect( '{"AbraKadabra":"Хначение"}'.from_json ).to eq ({ :AbraKadabra => "Хначение" })
  end

  it 'present? если не пустая' do
    expect( 's'.present? ).to eq true
    expect( ''.present? ).to eq false
  end
end
