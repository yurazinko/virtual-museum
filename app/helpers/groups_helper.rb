module GroupsHelper
	def next_element(index)
		if index != @groups.size - 1
			index = index + 1
		else
			index = 0		
		end
		index
	end
end
