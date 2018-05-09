namespace :import do
  desc "Import combined-rnv-files.csv"
  task rnv: :environment do
    if Rails.env=='production'
     	puts "========= Importing Data on Production =========="
	    ImportWorker.perform_async('https://s3-us-west-2.amazonaws.com/cars-database/combined-rnv-files.csv', User.first)
    else
     	puts "========= Importing Data on Development =========="
	    ImportWorker.perform_async('https://s3-us-west-2.amazonaws.com/cars-database/Test2.csv', User.first)
	  end
  end
end