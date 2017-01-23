module CapybaraFinders

	def tag(content)
		find("span.tag", text: content)
	end
end

RSpec.configure do |c|
	c.include CapybaraFinders, type: :feature
end