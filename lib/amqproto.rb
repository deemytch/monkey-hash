module AMQProto
  def self.correlation_id
    (Time.now.to_f * 1000000).to_i.to_s.freeze
  end
end
