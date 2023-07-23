
local Base256 = {}

Base256.Encode = function(Number)
	local Encoded = {}
	
	while Number > 0 do
		table.insert(Encoded, 1, (Number % 256))
		
	    Number = math.floor(Number / 256)
	end
	
	return string.char(table.unpack(Encoded))
end

Base256.Decode = function(String)
	local Table = {string.byte(String, 1, -1)}
	
	local Decoded = 0
	for Index = 1, #Table do
		Decoded = Decoded + Table[#Table - Index + 1] * 256 ^ (Index - 1) 
	end
	
	return Decoded
end

return Base256
