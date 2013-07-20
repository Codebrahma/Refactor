class PushDaemon

  def initialize
    @server = UDPServer.new(self)
    @worker = Worker.new
  end

  def start
    @worker.spawn(10)
    @server.listen
  end

  def call(data)
    process_request(data)
  end

  private

  def process_request(data)
    case data[0].split.first
    when "PING"
      @server.send("PONG", data[1][3], data[1][1])
    when "SEND"
      data[0][5..-1].match(/([a-zA-Z0-9_\-]*) "([^"]*)/)
      json = JSON.generate({
        "registration_ids" => [$1],
        "data" => { "alert" => $2 }
      })
      @worker << (json)
    end
  end
end