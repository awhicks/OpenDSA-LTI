# == Schema Information
#
# Table name: inst_module_section_exercises
#
#  id                     :bigint           not null, primary key
#  inst_module_version_id :bigint           not null
#  inst_module_section_id :bigint           not null
#  inst_exercise_id       :bigint           not null
#  points                 :decimal(5, 2)    not null
#  required               :boolean          default(FALSE)
#  threshold              :decimal(5, 2)    not null
#  options                :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  fk_rails_5c4fc2ff52  (inst_module_version_id)
#  fk_rails_9b61737c9f  (inst_exercise_id)
#  fk_rails_b320810099  (inst_module_section_id)
#
require 'rails_helper'

RSpec.describe InstModuleSectionExercise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
