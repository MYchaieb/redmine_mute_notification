class InsertMutecheckBox < Redmine::Hook::ViewListener

	def view_issues_edit_notes_bottom(context = {})

		project = context[:project]

		tag = context[:form].check_box :mute_notification
		# tag =  calendar_for('issue_delivery_date')

		if User.current.allowed_to?(:send_muted_notes, project)
			return content_tag(:p, tag)
		else
			return nil
		end

		
	end

end