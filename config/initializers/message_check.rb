#encoding : utf-8
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new

scheduler.every '300s'  do
    Message.all.each do |item|
        HardWorker.perform_async(item.id) if !item.is_pushed && item.push_count < 3
    end
end

scheduler.cron '00 03 * * *' do
  # every day at 3h00
  HotExerciseWorker.perform_async
end
