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

  # determine the type and find the class for that type 
  # and pass it to worker which call run
  def process_request(data)
    klass = Jobs.const_get(data.type.capitalize) rescue Jobs::Dummy
    job = klass.new(@server, data)
    @worker << job 
  end
end