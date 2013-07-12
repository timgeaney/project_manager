module ApplicationHelper

	def link_to_icon(icon_name, url_or_object, options={})
		options.merge!({ :class => "icon #{icon_name}.png" })

    link_to(image_tag("icons/#{icon_name}.png", { :title => icon_name }),
                      url_or_object,
                      options)
  end
end
