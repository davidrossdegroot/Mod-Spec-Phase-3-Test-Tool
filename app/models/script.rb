class Script < ActiveRecord::Base
  belongs_to :testcase
  #validates :script, presence => true
  #validates :expectedResult, presence => true
end
