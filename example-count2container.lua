--- set recipe to smelters batch.
-- FicsIt-Networks 0.3.19
-- Satisfactory Early Access Update 8

function sleep(sec)
    event.pull(sec)
end

local item = component.proxy("27DFEBB34E06E5A9CA754D8ADD6A5769")

print(item, item.internalName) -- Object<Build_StorageContainerMk1_C> Build_StorageContainerMk1_C_2147460090
print(item:getInventories()) -- table: 000001F3843F40F0
print(#item:getInventories()) -- 1 (always, mixed type items in container)

for k,v in pairs(item:getInventories()) do
	print(k, v, v.size, v.itemCount) -- 1 Object<Inventory> 24 100 (8x3 item slots, 100 items is mixed type)
end

repeat
    local inv = item:getInventories()[1]
    print(inv.itemCount) -- works well with realtime.
    sleep(1.0)
until( false )
