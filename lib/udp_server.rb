class UDPServer
  
  def initialize(app)
    @socket = UDPSocket.new
    @app    = app
  end

  def listen
    @socket.bind("0.0.0.0", 6889)

    loop { @app.call(receive) }
  end

  def send(msg, host, port)
    @socket.send(msg, 0, host, port)
  end

  private

  def receive
    @socket.recvfrom(4096)
  end

end
