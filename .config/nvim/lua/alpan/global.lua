P = function(v)
	print(vim.inspect(v))
	return v
end

R = function(name)
	package.loaded[name] = nil
	return require(name)
end
