
local item = component.proxy("27DFEBB34E06E5A9CA754D8ADD6A5769")
print(item, item.internalName)
local item = component.proxy("CF99D2A3438ECE25B5C2CDBA57BF33FE")
print(item, item.internalName)
--[[
2024.02.23-15.40.28 [Info] Object<Build_StorageContainerMk1_C> Build_StorageContainerMk1_C_2147460090
2024.02.23-15.40.28 [Info] Object<Computer_C> Computer_C_2147458968
]]--

local item = component.proxy("27DFEBB34E06E5A9CA754D8ADD6A5769")
print(item, item.internalName)
print(item:getInventories())
print(#item:getInventories())
for k,v in pairs(item:getInventories()) do
	print(k, v, v.size, v.itemCount)
end
--[[
2024.02.23-15.46.42 [Info] Object<Build_StorageContainerMk1_C> Build_StorageContainerMk1_C_2147460090
2024.02.23-15.46.42 [Info] table: 000001F3843F40F0
2024.02.23-15.46.42 [Info] 1 Object<Inventory> 24 100
Note. contianer slot size is 24.
Note. items = 50+25+25+200(mixed item types)
Note. 컨테이너 안에 여러종류가 섞여있어도, 1개의 Inventory Object만 있다.
]]--


smelter = component.proxy("2D2CE2B2413FBD44DAB436A7690A7F23") -- find it ID your self.
recipe = smelter:getRecipes()[1]
result = 999
bb = smelter:setRecipe(recipe, result)
print(result) -- 999
print(bb) -- Future: 00000179309195E8
print(bb:await()) -- true




local item = component.proxy("F2FB759440BEB9B83620A092175C699E")
print(item) -- Object<CodeableMerger_C>
-- print(item:ProductionChanged()) -- TODO No property or function with name 'ProductionChanged' found. Nil return is deprecated and this will become an error.
item:ItemRequest(inp, itm) -- member function
