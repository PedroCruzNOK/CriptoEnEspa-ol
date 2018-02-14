# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ApplicationSetting.where(setting_name: 'FACEBOOK_APP_ID').first_or_create do |setting|
  setting.setting_name = 'FACEBOOK_APP_ID'
  setting.value = ''
end

ApplicationSetting.where(setting_name: 'GOOGLE_ANALYTICS_ID').first_or_create do |setting|
  setting.setting_name = 'GOOGLE_ANALYTICS_ID'
  setting.value = ''
end

User.where(email: 'admin@admin').first_or_create do |user|
  user.email = 'admin@admin'
  password = 'admin'
  password_confirmation = 'admin'
end