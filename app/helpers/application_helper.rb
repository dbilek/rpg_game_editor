module ApplicationHelper
	def set_classname_if_flash_from_devise(flash)
		if flash == "notice"
			"success"
		elsif flash == "alert"
			"danger"
		else
			flash
		end
	end
end
