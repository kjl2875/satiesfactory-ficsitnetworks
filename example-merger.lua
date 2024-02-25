--- set recipe to smelters batch.
-- FicsIt-Networks 0.3.19
-- Satisfactory Early Access Update 8

-- OBJECT: SEND ITEM WHEN RECV THEM.

local merger = component.proxy("C005D0044DF11D169B2717ACEFD70796") -- TODO Change It Your self.
local counter = 0
print(merger) -- Object<CodeableMerger_C>

event.ignoreAll()
event.clear()
event.listen(merger)

while true do
	local e, s, p1, p2, p3, p4, p5 = event.pull()

    if merger.hash == s.hash and e == 'ItemRequest' then
		input = p1 -- 0=R,1=M,2=L
        item = p2

		while true do
			local transfered = merger:transferItem(input)
			if transfered then
				counter = counter + 1
				print(counter)
				break
			end
		end
	end
end
