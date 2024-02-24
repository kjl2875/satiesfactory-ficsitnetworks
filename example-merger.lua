--- set recipe to smelters batch.
-- FicsIt-Networks 0.3.19
-- Satisfactory Early Access Update 8

-- OBJECT: SEND ITEM WHEN RECV THEM.

local merger = component.proxy("C005D0044DF11D169B2717ACEFD70796") -- TODO Change It Your self.
print(merger) -- Object<CodeableMerger_C>

event.ignoreAll()
event.clear()
event.listen(merger)

while true do
    local s_name, o_build, n_dict, s_item = event.pull() -- ItemRequest Object<CodeableMerger_C>
    if s_name == 'ItemRequest' then
		local transfered = merger:transferItem(n_dict) -- 0=R,1=M,2=L
		-- print(transfered) -- true
	end
end
