module ApiHelper
  include HTTParty
  @headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJOYW1lIjoid2hhdHRoZWhlbGwiLCJVc2VySUQiOiI2OTIxOGIxOS0xMTgxLTRjYjctOGMxYS03ZDU5ZWUyMTliNzIiLCJyb2xlIjoiVXNlciIsIklzQWN0aXZlIjoiVHJ1ZSIsIklzRGVsZXRlZCI6IkZhbHNlIiwibmJmIjoxNTY2ODkyMTYwLCJleHAiOjE1Njc0OTIxNjAsImlhdCI6MTU2Njg5MjE2MH0.q80xTW3RlnfrN4OvUNxsWHgB5gePS3krhVcD7WwkJSE",
  }

  def self.get(api_uri, params)
    @options = {
      query: params,
      headers: @headers,
    }

    HTTParty.get(api_uri, @options)
  end

  def self.post(api_uri, params)
    @options = {
      body: params.to_json,
      headers: @headers,
    }

    HTTParty.post(api_uri, @options)
  end

  def self.put(api_uri, params)
    @options = {
      body: params.to_json,
      headers: @headers,
    }

    HTTParty.put(api_uri, @options)
  end
end
