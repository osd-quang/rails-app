# require "rufus-scheduler"

# scheduler = Rufus::Scheduler.new

# scheduler.every "20m" do
#   conn = Faraday.new(:url => "https://images-api.nasa.gov") do |faraday|
#     faraday.request :url_encoded
#     faraday.response :logger
#     faraday.adapter Faraday.default_adapter
#   end

#   #get queue
#   @queues = JobQueue.all().where(status: false)

#   @queues.each do |queue|
#     response = conn.get "/search", { q: queue.query_key, page: queue.page, media_type: queue.media_type }
#     items = JSON.parse(response.body)["collection"]["items"]

#     items.each do |item|
#       @image = Image.new()
#       @image.link = item["links"][0]["href"]
#       @image.title = item["data"][0]["title"]
#       @image.description = item["data"][0]["description"]
#       @image.job_queue_id = queue.id
#       @image.save
#     end
#     queue.status = true
#     queue.save
#   end
# end
