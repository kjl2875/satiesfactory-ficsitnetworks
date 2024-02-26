
local item = component.proxy("27DFEBB34E06E5A9CA754D8ADD6A5769")
print(item, item.internalName)
local item = component.proxy("CF99D2A3438ECE25B5C2CDBA57BF33FE")
print(item, item.internalName)
--[[
2024.02.23-15.40.28 [Info] Object<Build_StorageContainerMk1_C> Build_StorageContainerMk1_C_2147460090
2024.02.23-15.40.28 [Info] Object<Computer_C> Computer_C_2147458968
]]--

--------------------------------------------------------------------

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

--------------------------------------------------------------------

smelter = component.proxy("2D2CE2B2413FBD44DAB436A7690A7F23") -- find it ID your self.
recipe = smelter:getRecipes()[1]
result = 999
bb = smelter:setRecipe(recipe, result)
print(result) -- 999
print(bb) -- Future: 00000179309195E8
print(bb:await()) -- true
--------------------------------------------------------------------

local item = component.proxy("F2FB759440BEB9B83620A092175C699E")
print(item) -- Object<CodeableMerger_C>
-- print(item:ProductionChanged()) -- TODO No property or function with name 'ProductionChanged' found. Nil return is deprecated and this will become an error.
item:ItemRequest(inp, itm) -- member function

--------------------------------------------------------------------

local input = 1
local comonent_merger = component.proxy("C005D0044DF11D169B2717ACEFD70796")
print(comonent_merger) -- Object<CodeableMerger_C>
-- flush 2 items in merger
transfered = comonent_merger:transferItem(input)
while transfered do
	transfered = comonent_merger:transferItem(input)
end

--------------------------------------------------------------------

local uuids = component.findComponent(classes['Build_ConstructorMk1_C'])
local constructor = {}
for n=1,#uuids do
	constructor[n] = component.proxy(uuids[n])
end
print(table.concat(uuids, ', ')) -- AD3AA55640FC92563D2F07AFDA3F10E5, 15CD943542C472FE55D94BB7C80C09B9, D7FEB7F542A72607323987BB93B04DA6, EE8FD8A440FB35BEF5BFDD90BDA32C8C, 20E3F164462D5D46806843B834B028E5, 788FBA5343F5FC799F9ECE818B43EF39, 53EC1A34461D2EE5BD25DF8EF436F356, CD3FF4534FE6C4A2A7E56995E3FD7FDD, A1476B48460D51138FD122B53D8EA123, 8D954B674DC404EDB93FFEB0B3D39059, A236A5BD46F1906EC8989DB894608429, 165C6AC74EEDC239914A978464D8BAA0, 64F869454650D6CAED5C9F9E203A9C83, AFDB3CB84D9831E085201A8C19D17B9E, 36D6225F4C092B45C3731297B5799288, 542459084320784EB1A25E8A10F5E4BB, 2E458B0F43A23EB4781FD986A703B425, 3BA0813C407365ABB845C892F919F3CA, 36F7CFD040A2A23D5B2F29BBD8FC565B, 22B3383F43B489F87DC2F39736C5F41C, 0CBA732F4A7D262A28E2D4AB8EB7E179, 27BD9E054EC2C5BDC23A7EB13300046E, D8B1CCF144544F290D34EF957D25865D, A03E4A034A162F3E9B277A9AC99B96CB, DAF9A1C44FF0ECB73BF4F393501219E1, B35F56D64A1232CB0885F086BCA4D8FD, 5A467E074FCC4B89B33F0C8B709272C4, E741848F4058B331B93E90815536939C, 34B33BBD42691E7C9D1B4BA9591C8307, 128254E048BBE2B9058C978325296D15, FBA315C44BB53AE9EE051C955DCF5D53, B4B4B1F64BC39010A1D1BDB62D6CE7B4, 9F7A05D6422F1594B95BE09F9D5F3C41, A53306944AAD275BE0CBB191D4405AB1, 662E39C54AACF5997D4CE5AD5D135B14, 875E248842F23E00161AB79ED1C7D496
print(constructor[1], #constructor) -- Object<Build_ConstructorMk1_C> 36
