class GetImageJob < ApplicationJob
  queue_as :default

  def perform(args)
    puts "===== doing ====="

    conn = Faraday.new(:url => "https://images-api.nasa.gov") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get "/search", { q: args["query_key"], page: args["page"], media_type: args["media_type"] }
    items = JSON.parse(response.body)["collection"]["items"]

    items.each do |item|
      @source = Source.new()
      @source.title = item["data"][0]["title"]
      @source.save
    end

    puts "===== done ====="
  end
end
