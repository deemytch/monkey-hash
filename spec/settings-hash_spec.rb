require 'yaml'

RSpec.describe Hash do

  let( :cfg ){ { app: { id: 'test', data: %w[ А Б В Г ] } } }

  it 'инициализируется из хэша' do
    expect( cfg.app.id ).to eq 'test'
    expect( cfg.app.data.first ).to eq 'А'
  end

  it 'инициализируются из большого хэша' do
    cfgname = 'spec/settings/config.testingtest.yml'
    # puts "cfgname: #{  cfgname }."
    cfg1 = YAML.load_file( cfgname )
    expect( cfg1.services.usersrb.publish[ 3000 ] ).to eq 3000
    expect( cfg1.app.id ).to eq 'cfgsettings'
  end

  it 'Можно получить доступ к данным разными способами' do
    expect( cfg[:app][:id] == cfg.app.id ).to be_truthy
  end

  it 'Можно спросить, если ли ключ разными способами' do
    expect( cfg.app.id? ).to be_truthy
    expect( cfg.app.key?( :id )).to be_truthy
    expect( cfg[:non] ).to be_nil
    expect( cfg.non? ).to be_falsy
  end

  it 'можно присвоить значение разными способами' do
    expect( cfg.app.loglevel ).to be_nil
    cfg.app.loglevel = 'WARN'
    expect( cfg.app.loglevel ).to eq 'WARN'
    cfg.app[:loglevel] = 'INFO'
    expect( cfg.app.loglevel ).to eq 'INFO'
  end

  it 'понимает ключи типа Integer' do
    cfg.services = { clerk: {}, usersrb: {} }
    expect( cfg.services.clerk ).to be_a Hash
    cfg.services.clerk.publish = { 1024 => 1080}
    expect( cfg.services.clerk.publish[ 1024 ] ).to eq 1080
    cfg[:services][:clerk][:publish][ 443 ] = 2048
  end

end
