namespace :import do
  desc "Import combined-rnv-files.csv"
  task rnv: :environment do
  	puts "========= Importing Data =========="
     ImportJob.perform_later 'https://s3-us-west-2.amazonaws.com/cars-database/combined-rnv-files.csv', User.first
  end
end