class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "***** Hello #{args} *****"
  end
end
