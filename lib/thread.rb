class Thread
  def wait_for_key( k, tmout = Cfg.app.tmout.service )
    start_time = Time.now
    sleep 0.01 until Thread.current.thread_variable?( k ) || Time.now - start_time >= tmout
    return Time.now - start_time < tmout
  end
end
