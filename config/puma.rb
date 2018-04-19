threads_count = ENV.fetch("RAILS_MAX_THREADS") { 2 }.to_i
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }
app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
plugin :tmp_restart
