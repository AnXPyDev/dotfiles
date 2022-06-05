log = (tbl, maxdepth, depth) ->
	if depth == nil
		depth = 0
	if maxdepth == nil
		maxdepth = 2
	if depth == maxdepth + 1
		return
	for k, v in pairs tbl
		io.write("#{string.rep(" ", depth * 2)}[#{k}] #{v}\n")
		if type(v) == "table"
			log(v, maxdepth, depth + 1)

return log
