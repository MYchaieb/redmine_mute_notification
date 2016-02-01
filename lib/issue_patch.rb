module IssueMutePatch 
	def self.included(base)
		base.send(:include, InstanceMethods)
		base.class_eval do 
			unloadable 

			
			delegate :notes, :notes=, :mute_notification, :mute_notification=, :to => :current_journal, :allow_nil => true
			safe_attributes 'mute_notification',
		    :if => lambda {|issue, user| !issue.new_record? && user.allowed_to?(:send_muted_notes, issue.project)}
		end
	end

	module InstanceMethods

	end

end