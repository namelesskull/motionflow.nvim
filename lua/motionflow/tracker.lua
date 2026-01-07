local M = {}

M.log = {}
M.max = 40

local motions = {
	h = true,
	j = true,
	k = true,
	l = true,
	w = true,
	b = true,
	e = true,
	["0"] = true,
	["^"] = true,
	["$"] = true,
	G = true,
}

local pending = ""

function M.on_key(key)
	-- detect text object combo
	if pending ~= "" then
		local combo = pending .. key
		if combo:match("^[dcya][ai][%a]$") then
			table.insert(M.log, combo)
			pending = ""
			return
		end
		pending = ""
	end

	if key:match("^[dcya]$") then
		pending = key
		return
	end

	if motions[key] then
		table.insert(M.log, key)
	end

	if #M.log > M.max then
		table.remove(M.log, 1)
	end
end

function M.flow()
	return table.concat(M.log, "")
end

return M
