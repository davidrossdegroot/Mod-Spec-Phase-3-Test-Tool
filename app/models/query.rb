class Query < ActiveRecord::Base
  belongs_to :testcase
  validates :DirectAddress, :presence => {
  :message => "Please enter a Direct Address." }
  after_validation :parse_script_and_add_parameter, :run_script
    
  protected
  def parse_script_and_add_parameter
    base_script = self.testcase.script
    case base_script
     #parse the domain name from the email address
    when /~domain/
        if self.DirectAddress.include?("@")
          d= self.DirectAddress.partition("@")[2]
          #add the domain name to the script
          @updated_script=base_script.sub("~domain",d)
        else self.pass = false
        end
    when /~email/
          e= self.DirectAddress
          #add the email address to the script
        @updated_script.sub("~email",e)
    when /~dnsemail/
         #add the email address formatted as a domain name to the script
        d= self.DirectAddress.sub("@",".")
        @updated_script=base_script.sub("~dnsemail",d)
      else self.pass = false  
    end
  end
  protected
  def run_script
    ran_script=%x[#{@updated_script}]
        #figure out what to do with the information returned in the script... 
        if ran_script.include?(self.testcase.expected_result)
          self.pass = true
        else
          self.pass = false
        end
  end
end
