#encoding : utf-8
require 'rufus-scheduler'
scheduler = Rufus::Scheduler.new

scheduler.every '300s'  do
    Message.all.each |item| do
        HardWorker.perform_async(item.id) if !item.is_pushed && item.push_count < 3
    end
end
