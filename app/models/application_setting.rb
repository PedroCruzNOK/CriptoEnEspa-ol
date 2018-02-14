class ApplicationSetting < ApplicationRecord
  validates :setting_name, presence: true
end
