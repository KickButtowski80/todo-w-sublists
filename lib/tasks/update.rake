namespace :update do
   desc "update user_id in todo list"
   task :db => :environment do
        User.all.each do |u|
         TodoList.all.each do |l|
              l.update(user_id: u.id) if l.owner == u.name
         end
        end
    end
end
