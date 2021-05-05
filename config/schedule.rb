env :PATH, ENV['PATH']
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
# ENV.each { |k, v| env(k, v) }
set :output, 'log/cron.log'
job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"
every 2.minutes, :roles => [:app] do
  sidekiq "HardWorker"
end
