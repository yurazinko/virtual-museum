module GroupsHelper
	def next_element(index)
		if index != @groups.size - 1
			index = index + 1
		else
			index = 0		
		end
		index
	end

	def build_breadcrumbs(group)
		result = []
    group.ancestors.each do |ancestor|
    	result << content_tag(:li, class: "breadcrumb-item") do 
    		link_to(ancestor.name, ancestor)
    	end
    end
    result << content_tag(:li, group.name, class: "breadcrumb-item-active")
    result.join('').html_safe
	end
end
