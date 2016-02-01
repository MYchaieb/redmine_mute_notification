module JournalMutePatch
	def self.included(base)
		base.send(:include, InstanceMethods)
		base.class_eval do 
			alias_method :activate_send_notification, :send_notification
  			alias_method :send_notification, :verify_mute
		end
	end

	module InstanceMethods
		def verify_mute
		    if !mute_notification
		     	activate_send_notification
		    end 
		end

	end

end