namespace :heroku do
  desc 'Drops development DB and replaces it with the production DB'
  task pg_pull: :environment do
    puts '-----> Setting the environment...'
    run 'RAILS_ENV=development rails db:environment:set'

    puts '-----> dropping DB…'
    run 'rails db:drop'

    puts '-----> pulling the DB...'
    run 'heroku pg:pull postgresql-contoured-92476 wedding_planner_development'
  end

  def run(*cmd)
    system(*cmd)
    raise "Command #{cmd.inspect} failed!" unless $?.success?
  end
end
