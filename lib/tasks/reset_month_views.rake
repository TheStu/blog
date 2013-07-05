desc "reset the monthly view counter on Post on the 1st of every month"
task :reset_monthly_view_count => :environment do

  if Time.now.today == 1
    Post.find_each do |post|
      post.monthly_view_count = 0
      post.save
    end
  end

end
