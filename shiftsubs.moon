export script_name = 'Shift subs'
export script_description = 'Shifts subs'

shift = ( sub, sel, act ) ->
	firstline = sub[sel[1]]
	secondline = sub[sel[2]]
	timediff = secondline.start_time - firstline.start_time
	for i = 2, #sel
		with line = sub[sel[i]]
			.start_time -= timediff
			if .start_time < 0
				.start_time = 0
			.end_time -= timediff
			if .end_time < 0
				.end_time = 0
			sub[sel[i]] = line
	sub.delete sel[1]

aegisub.register_macro "Shift subs", "Shift subs", shift
