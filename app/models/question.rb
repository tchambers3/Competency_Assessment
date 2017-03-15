class Question < ActiveRecord::Base
  validates_prescence_of :question

  # QUESTION: Should we allow some way to order the questions?:
  scope :active, -> { where('active=?',true) }
  scope :inactive, -> { where('active=?',false) }


end
