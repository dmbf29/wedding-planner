user = User.find_or_initialize_by(email: 'douglasmberkley@gmail.com')
unless user.persisted?
  user.password = ENV['ADMIN_PASSWORD']
  user.save!
end

user = User.find_or_initialize_by(email: 'real7210@gmail.com')
unless user.persisted?
  user.password = ENV['ADMIN_PASSWORD']
  user.save!
end
