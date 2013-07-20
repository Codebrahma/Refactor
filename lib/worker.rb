class Worker
  
  def initialize
    @queue  = Queue.new
    @client = HTTPClient.new
  end

  def spawn(count)
    count.times do
      Thread.new do
        while data = @queue.pop
          @client.post("https://android.googleapis.com/gcm/send", data, {
            "Authorization" => "key=AIzaSyCABSTd47XeIH",
            "Content-Type" => "application/json"
          })
        end
      end
    end
  end

  def <<(data)
    @queue << data
  end
end