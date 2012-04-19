class Testcase < ActiveRecord::Base
  has_many :queries, :dependent => :destroy
  has_many :scripts, :dependent => :destroy
  accepts_nested_attributes_for :scripts, :allow_destroy => true
  validates :TcId, :uniqueness => {:message => 'Must be a unique Test Case Id'}, 
    :presence => {:message => 'Must contain a Test Case ID'}
end
