--[[

			  ┌─────────────────────────────────────────────── Container
              │                                                    │
Container ─ Merger ─ {Constructor,Constructor,...} ─<Balancer>─ Spliter ─ Container

1. 모든 Constructor의 Recipe를 Iron Rod로 설정. (ConstructorID를 자동으로 못가져옴)
2. Merger는 Left에서 들어온 Iron Ignot 2400개 보내기. (2400 = 1container = 24stacks * 100count)
3. Spliter는 들어온 Item 2400개를 Right로 보내기. (2400개 생산)
4. 모든 Constructor의 Recipe를 Screw로 설정.
5. Merger는 Center에서 들어온 Item 2400개 보내기.
6. Spliter는 들어온 Item 9600개를 Left로 보내기. (9600개 생산)
7. 작업종료 알림.

Note. Input Interface for {Constructor,Constructor,...} = 
]]--

-- FicsIt-Networks 0.3.19
-- Satisfactory Early Access Update 8

local list_constructors = component.findComponent(classes['Build_ConstructorMk1_C'])
for n=1,#list_constructors do
	list_constructors[n] = component.proxy(list_constructors[n])
end
local compnent_merger = component.proxy("6E5876DC486CE41AE27D02B7EA32CA2F")
local compnent_spliter = component.proxy("5936D686498767F115FBAA9AF67DD7BA")
local recipe_set
local output
local m_counter = {}
local input

event.ignoreAll()
event.clear()
event.listen(compnent_merger)
event.listen(compnent_spliter)

--------------------------------------------------------------------------------------------------------------
-- 1. 모든 Constructor의 Recipe를 Iron Rod로 설정. (ConstructorID를 자동으로 못가져옴)

recipe_set = nil
for n,recipe in pairs(list_constructors[1]:getRecipes()) do
	if recipe.internalName == 'Recipe_IronRod_C' then
		recipe_set = recipe
		break
	end
end
if recipe_set == nil then
    assert()
end

for n,constructor in pairs(list_constructors) do
    gotSet = constructor:setRecipe(recipe_set)
    if not gotSet then
        assert()
    end
end

print('Recipe Set: '..recipe_set.name)


--------------------------------------------------------------------------------------------------------------
-- 2. Merger는 Right에서 들어온 Iron Ignot 2400개 보내기. (2400 = 1container = 24stacks * 100count)
-- 3. Spliter는 들어온 Item 2400개를 Right로 보내기. (2400개 생산)

m_counter['merger'] = 0
m_counter['splitter'] = 0
while m_counter['splitter']<2400 do
	local e, s, p1, p2, p3, p4, p5 = event.pull(1.0)
    local ca = 0
    local cb = 0

    while compnent_merger:transferItem(0) do
        ca = ca + 1
    end

    while compnent_spliter:transferItem(2) do
        cb = cb + 1
    end

    if ca+cb > 0 then
        m_counter['merger'] = m_counter['merger'] + ca
        m_counter['splitter'] = m_counter['splitter'] + cb
        print(m_counter['merger'], m_counter['splitter'])
    end
end

--------------------------------------------------------------------------------------------------------------
-- 4. 모든 Constructor의 Recipe를 Screw로 설정.

recipe_set = nil
for n,recipe in pairs(list_constructors[1]:getRecipes()) do
	if recipe.internalName == 'Recipe_Screw_C' then
		recipe_set = recipe
		break
	end
end
if recipe_set == nil then
    assert()
end

for n,constructor in pairs(list_constructors) do
    gotSet = constructor:setRecipe(recipe_set)
    if not gotSet then
        assert()
    end
end

print('Recipe Set: '..recipe_set.name)

--------------------------------------------------------------------------------------------------------------
-- 5. Merger는 Center에서 들어온 Item 2400개 보내기.
-- 6. Spliter는 들어온 Item 9600개를 Left로 보내기. (9600개 생산)

m_counter['merger'] = 0
m_counter['splitter'] = 0
while m_counter['splitter']<9600 do
    local e, s, p1, p2, p3, p4, p5 = event.pull(1.0)
    local ca = 0
    local cb = 0

    while compnent_merger:transferItem(1) do
        ca = ca + 1
    end

    while compnent_spliter:transferItem(0) do
        cb = cb + 1
    end

    if ca+cb > 0 then
        m_counter['merger'] = m_counter['merger'] + ca
        m_counter['splitter'] = m_counter['splitter'] + cb
        print(m_counter['merger'], m_counter['splitter'])
    end
end

--------------------------------------------------------------------------------------------------------------
-- 7. 작업종료 알림.

computer.beep(0)
print('E.O.F.')
