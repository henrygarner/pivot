module MetricsHelper
	
	def cube_table(cube)
		"<table border=\"1\"><tr>#{render_table_section(cube, cube.to_h)[1]}</tr></table>"
	end
	
	def render_table_section(cube, cells, depth=0)
		if cells.is_a? Hash
			total = 0
			dimension = cube.dimensions[depth]
			grain = dimension.grain
			keys = dimension.class.all.collect { |dimension| dimension.send grain }.uniq
			html = keys.collect do |key|
				count, html = render_table_section cube, cells[key], depth+1
				total = total + count
				"<td rowspan=\"#{count}\">#{key}</td>#{html}"
			end.join('</tr><tr>')
			return total, html
		else
			return 1, "<td>#{cells}</td>"
		end
	end
end
