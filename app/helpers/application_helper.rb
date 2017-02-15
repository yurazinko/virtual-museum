module ApplicationHelper
		def photo_path(model, output)
			if model.photo.present?
				output
		else
			"/assets/default_photo.jpg"
		end
	end
end
