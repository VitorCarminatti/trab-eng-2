module ApplicationHelper

	def flash_message
	    messages = ""
    	[:notice, :info, :warning, :error].each {|type|
	      	if flash[type]
	        	messages += "&lt;p class=\"alert alert-success #{type}\"&gt;#{flash[type]}&lt;/p&gt;"
	      	end
	    }

	    messages
  	end

end
