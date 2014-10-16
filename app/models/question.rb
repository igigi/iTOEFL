class Question < ActiveRecord::Base
  has_many :tasks
  has_many :marks, through: :tasks

  has_many :works

  def self.by_set(set)
    where(set: set)
  end

  def self.by_number(number)
    where(number: number)
  end

  def self.by_subject(subject)
    where(subject: subject)
  end

  def self.by_source(source)
    where(source: source)
  end
end
