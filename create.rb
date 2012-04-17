
#make this "run" instead of "create". Change all of the code to be how it takes 
    #the email and passes it into the right script for the test
     #see page 116 of the Rails book for an example of this.
    print "Enter script"
	@script=gets
 print "Enter Direct Address"
        @DirectAddress=gets
    base_script=case @script 
    when base_script /domain/
        d=@DirectAddress.partition("@")[2]
        #add the domain name to the script
        updated_script=base_script.sub("domain",d)
         #run the script. if it returns a value, then this passes
        ran_script=%x[#{updated_script}]
        #figure out what to do with the information returned in the script... 
        if ran_script==true
        pass=true
        else
          pass=false
        end
    when base_script /#email/
          e=DirectAddress
          updated_script.sub("email",e)
          ran_script=%x[#{updated_script}]
          if ran_script==true
        pass=true
        else
         pass=false
        end
    when base_script /#dnsemail/
        d=DirectAddress.sub("@",".")
        updated_script=base_script.sub("dnsemail",d)
        ran_script=%x[# {updated_script}]
        if ran_script==true
        pass=true
        else
          pass=false
        end
    else 
      pass=false
  end
