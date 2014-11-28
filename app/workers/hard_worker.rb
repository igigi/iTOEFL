class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    # do something
    puts 'Doing hard work'
  end
end