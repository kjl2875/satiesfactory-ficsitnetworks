--[[

Note. 미완성 프로그램, TODO 참조.

			  ┌─────────────────────────────────────────────── Container
              │                                                    │
Container ─ Merger ─ {Constructor,Constructor,...} ─<Balancer>─ Spliter ─ Container

1. 모든 Constructor의 Recipe를 Iron Rod로 설정. (ConstructorID를 자동으로 못가져옴)
2. Merger는 Left에서 들어온 Iron Ignot 2400개 보내기. (2400 = 1container = 24stacks * 100count)
3. Spliter는 들어온 Item 2400개를 Right로 보내기. (2400개 생산)
4. 모든 Constructor의 Recipe를 Screw로 설정.
5. Merger는 Right에서 들어온 Item 2400개 보내기.
6. Spliter는 들어온 Item 9600개를 Center로 보내기. (9600개 생산)
7. 작업종료 알림.

Note. Input Interface for {Constructor,Constructor,...} = 
]]--

-- FicsIt-Networks 0.3.19
-- Satisfactory Early Access Update 8

local list_constructors = {}
list_constructors[#list_constructors+1] = component.proxy("3DD99CDB41C7E5EEDF795C898F1F4F9E")
list_constructors[#list_constructors+1] = component.proxy("5203088E4A4C2BC2CCB486A27FDA82B3")
list_constructors[#list_constructors+1] = component.proxy("508383EB463B75F619DE1CA79B319021")
list_constructors[#list_constructors+1] = component.proxy("A64A442D4747034D371B9B8DB330C1C9")
local compnent_merger = component.proxy("4AF5BD864858B842D7BDEDB1E0DBC121")
local compnent_spliter = component.proxy("4481111D44640425C79BDDAA2329EA6D")
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
-- 2. Merger는 Left에서 들어온 Iron Ignot 2400개 보내기. (2400 = 1container = 24stacks * 100count)
-- 3. Spliter는 들어온 Item 2400개를 Left로 보내기. (2400개 생산)

m_counter['merger'] = 0
m_counter['splitter'] = 0
while m_counter['splitter']<2400 do
	local e, s, p1, p2, p3, p4, p5 = event.pull(1.0)

    if e ~= nil then
        
        if compnent_merger.hash == s.hash and e == 'ItemRequest' then
            input = p1 -- 0=L,1=M,2=R
            item = p2

            if input == 0 then
                while true do
                    local transfered = s:transferItem(input)
                    if transfered then
                        m_counter['merger'] = m_counter['merger'] + 1
                        print(m_counter['merger'], m_counter['splitter'])
                        break
                    end
                end
            end
        end

        if compnent_spliter.hash == s.hash and e == 'ItemRequest' then
            item = p1
            output = 0 -- 0=L,1=M,2=R

            while true do
                local transfered = s:transferItem(output)
                if transfered then
                    m_counter['splitter'] = m_counter['splitter'] + 1
                    print(m_counter['merger'], m_counter['splitter'])
                    break
                end
            end
        end

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
-- 5. Merger는 Right에서 들어온 Item 2400개 보내기.
-- 6. Spliter는 들어온 Item 9600개를 Center로 보내기. (9600개 생산)
-- TODO output이 너무 느려서, input에서 병목이 심하게 걸린다.

m_counter['merger'] = 0
m_counter['splitter'] = 0

input = 2 -- 0=L,1=M,2=R
while true do
    if compnent_merger:transferItem(input) then
        m_counter['merger'] = m_counter['merger'] + 1
    else
        break
    end
end

while m_counter['splitter']<9600 do

    local e, s, p1, p2, p3, p4, p5 = event.pull(1.0)

    if e ~= nil then
        if compnent_merger.hash == s.hash and e == 'ItemRequest' then
            input = p1 -- 0=L,1=M,2=R
            item = p2

            if input == 2 then
                while true do
                    local transfered = s:transferItem(input)
                    if transfered then
                        m_counter['merger'] = m_counter['merger'] + 1
                        print(m_counter['merger'], m_counter['splitter'])
                        break
                    end
                end
            end
        end

        if compnent_spliter.hash == s.hash and e == 'ItemRequest' then
            item = p1
            output = 1 -- 0=L,1=M,2=R

            while true do
                local transfered = s:transferItem(output)
                if transfered then
                    m_counter['splitter'] = m_counter['splitter'] + 1
                    print(m_counter['merger'], m_counter['splitter'])
                    break
                end
            end
        end
    end

end

--------------------------------------------------------------------------------------------------------------
-- 7. 작업종료 알림.

computer.beep(0)
print('E.O.F.')
