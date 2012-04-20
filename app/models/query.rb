class Query < ActiveRecord::Base
  belongs_to :testcase
  validates :DirectAddress, :presence => {
  :message => "Please enter a Direct Address." }
  after_validation :get_first_script
    
  protected
  def get_first_script
    @testcase = self.testcase
    first_script = Script.where(:testcase_id => @testcase.id).first.id
    parse_script_add_parameters(first_script)
  end
  
  protected
  def parse_script_add_parameters(script_id)
      scriptmodel = Script.find(script_id)
      @script = scriptmodel.script
      case @script
      #parse the domain name from the email address
      when /~domain/
            d = self.DirectAddress.partition("@")[2]
            #add the domain name to the script
            @updated_script = @script.sub("~domain",d)
            run_script(@updated_script, scriptmodel.expectedResult, scriptmodel.id+1)
      when /~email/
            e = self.DirectAddress
            #add the email address to the script
          @updated_script = @script.sub("~email",e)
          run_script(@updated_script, scriptmodel.expectedResult, scriptmodel.id+1)
      when /~dnsemail/
          #add the email address formatted as a domain name to the script
          d = self.DirectAddress.sub("@",".")
          @updated_script = @script.sub("~dnsemail",d)
          run_script(@updated_script, scriptmodel.expectedResult, scriptmodel.id+1)
      when /~last_response/
          last_scriptmodel = Script.where(:id => scriptmodel.id-1)
          last_expected_result = last_scriptmodel.expectedResult
          @updated_script = @script.sub("~last_response", @script.expectedResult)
          run_script(@updated_script, scriptmodel.expectedResult, scriptmodel.id+1)
      else self.pass = false  
      end
  end
  
protected
  def run_script(script, expected_result, next_script_id)
    until !self.pass.nil?
      next_script = Script.find(next_script_id)
      ran_script = `#{script}` 
        if ran_script.include?(expected_result)
          if next_script.script.empty?
            self.pass = true
          else parse_script_add_parameters(next_script.id)
          end
        else
          self.pass = false
        end
    end
  end
  
  protected
  def check_cert_validity
    #put the cert checks here if you can get them to work
  end
end
