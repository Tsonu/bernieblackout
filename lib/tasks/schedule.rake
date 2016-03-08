namespace :schedule do
  desc "Retrieves and parses all sources into the database"
  task fetch_sources: :environment do
    Source.retrieve_source_all
  end

end
