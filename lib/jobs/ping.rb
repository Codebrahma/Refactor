module Jobs
  class Ping < Job
    def run
      @server.send("PONG", @data.ip, @data.port)
    end
  end
end