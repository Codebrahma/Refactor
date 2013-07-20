module Jobs
  class Send < Job

    def run
      json = JSON.generate({
        "registration_ids" => [@data.token],
        "data" => { "alert" => @data.message }
      })
      @client = HTTPClient.new

       @client.post("https://android.googleapis.com/gcm/send", json, {
            "Authorization" => "key=AIzaSyCABSTd47XeIH",
            "Content-Type" => "application/json"
        })
    end
  end
end