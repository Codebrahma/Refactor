class UDPResponse

  def initialize(data)
    @data = data
  end

  def type
    @data[0].split.first
  end

  def ip
    @data[1][3]
  end

  def port
    @data[1][1]
  end

  def parse
    @parsed_data ||= @data[0][5..-1].match(/([a-zA-Z0-9_\-]*) "([^"]*)/)
  end

  def message
    parse[2]
  end

  def token
    parse[1]
  end
  
end