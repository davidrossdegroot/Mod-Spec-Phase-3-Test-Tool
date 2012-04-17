class Script
def initialize
print "enter a script with a domain name /n"
dom=dig gmail.com
@ran_script=%x[#{dom}]
puts @ran_script
        #figure out what to do with the information returned in the script...
end
end
