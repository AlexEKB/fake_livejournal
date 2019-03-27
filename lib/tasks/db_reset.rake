desc 'Drop, create, migrate database'

task db_reset: :environment do
  sh %{ rails db:drop db:create db:migrate }
end
