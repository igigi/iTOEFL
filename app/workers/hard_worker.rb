class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    # do something
    put 'Doing hard work'
  end
end