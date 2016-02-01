require 'redmine'

require_dependency 'issue_patch'

require_dependency 'journal_patch'
require_dependency 'checkbox_patch'

ActionDispatch::Callbacks.to_prepare do
	require_dependency 'issue'
	require_dependency 'journal'
	Issue.send(:include, IssueMutePatch)
	Journal.send(:include,JournalMutePatch)
end


Redmine::Plugin.register :redmine_mute_notification do
	name 'Mute Notification plugin'
	author 'Chaieb Yassine'
	description 'This plugin allow to give permission to do not send mail notification on a issue comment'
	version '1.0.0'
	url 'https://github.com/MYchaieb/redmine_mute_notification'
	author_url 'https://github.com/MYchaieb'



    project_module :issue_tracking do |map|
	  	map.permission :send_muted_notes, {}, :require => :member
	end
end
