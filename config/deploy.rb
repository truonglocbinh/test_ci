# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"
set :application, 'test_app'
set :keep_releases, 5
set :bundle_without, [:development, :test]
set :repo_url, 'git@gitlab.com:truonglocbinh/test_app.git'
set :rbenv_ruby, '2.7.2'
set :deploy_to, '/var/www/test_app'
set :yarn_flags, "--production --check-files"
set :linked_files, %w[config/master.key config/credentials.yml.enc config/database.yml]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/communities node_modules]

set :prune_bundler, true
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
threads_count = ENV.fetch('RAILS_MAX_THREADS') { 4 }.to_i
set :puma_threads, [threads_count, threads_count]
set :puma_workers, ENV.fetch('WEB_CONCURRENCY') { 4 }
set :puma_init_active_record, false
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_tag, fetch(:application)
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"