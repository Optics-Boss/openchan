class Rack::Attack
  if !ENV["REDIS_URL"] || Rails.env.test?
    cache.store = ActiveSupport::Cache::MemoryStore.new
  end

  throttle("req/up", limit: 500, period: 5.minutes) do |req|
    req.ip
  end

  throttle("boards", limit: 10, period: 1.minute) do |req|
    req.ip if req.path.include?("/boards") && req.post?
  end

  throttle("topics", limit: 10, period: 1.minute) do |req|
    req.ip if req.path.include?("/topics") && req.post?
  end
end
