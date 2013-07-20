class Worker
  
  def initialize
    @queue  = Queue.new
  end

  def spawn(count)
    count.times do
      Thread.new do
        while job = @queue.pop
         job.run
        end
      end
    end
  end

  def <<(data)
    @queue << data
  end
end