# == Schema Information
#
# Table name: lms_instances
#
#  id              :bigint           not null, primary key
#  url             :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  lms_type_id     :bigint
#  consumer_key    :string(255)
#  consumer_secret :string(255)
#  organization_id :bigint
#
# Indexes
#
#  index_lms_instances_on_url        (url) UNIQUE
#  lms_instances_lms_type_id_fk      (lms_type_id)
#  lms_instances_organization_id_fk  (organization_id)
#
class LmsInstance < ApplicationRecord
  #~ Relationships ............................................................
  has_many  :lms_accesses, inverse_of: :lms_instances
  has_many  :course_offerings, inverse_of: :lms_instance
  belongs_to  :lms_type, inverse_of: :lms_instances
  belongs_to :organization
  # has_many :users, :through => :lms_accesses

  #~ Validation ...............................................................

  validates_presence_of :lms_type, :url, :organization
  validates :url, uniqueness: true

  def self.get_oauth_creds(key)
    lms_instance = LmsInstance.where(consumer_key: key).first
    if lms_instance.blank? or lms_instance.consumer_key.blank? or lms_instance.consumer_secret.blank?
      return nil
    end
    consumer_key = lms_instance.consumer_key
    consumer_secret = lms_instance.consumer_secret
    {consumer_key => consumer_secret}
  end

  def has_oauth_creds?
    return not(self.consumer_key.blank? || self.consumer_secret.blank?)
  end

  def display_name
    "#{url}"
  end


  #~ Private instance methods .................................................
end
