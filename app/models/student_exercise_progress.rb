# == Schema Information
#
# Table name: student_exercise_progresses
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  exercise_id :integer          not null
#  progress    :text(65535)
#  grade       :decimal(5, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class StudentExerciseProgress < ApplicationRecord
end
