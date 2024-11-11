namespace :topic do
  desc "Delete records older than 1 day"
  task delete_1_days_old: :environment do
    Rails.logger.info "Deleting 1 day old posts"
    Topic.where("created_at < ?", 1.days.ago).each do |topic|
      topic.destroy
    end
  end
end
