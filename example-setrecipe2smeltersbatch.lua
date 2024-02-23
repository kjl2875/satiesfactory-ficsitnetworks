--- set recipe to smelters batch.
-- FicsIt-Networks 0.3.19
-- Satisfactory Early Access Update 8

-- define all smelters
smelter_table = {}
smelter_table[#smelter_table+1] = component.proxy("2D2CE2B2413FBD44DAB436A7690A7F23") -- find it ID your self.
smelter_table[#smelter_table+1] = component.proxy("C22AFF8B4BEBC1A1E80D6AB1701D451A")
smelter_table[#smelter_table+1] = component.proxy("3DF3794F421BA3D922E0D6AD00464B01")
smelter_table[#smelter_table+1] = component.proxy("B0AA1458468314ECAA1FADA85B2D4DAC")

-- smelter_recipe set for name
smelter_recipe_name = "철 주괴"
smelter_recipe = nil
for i,recipe in pairs(smelter_table[1]:getRecipes()) do
	print(i,recipe,recipe.name) -- 1 Class<Recipe> 철 주괴 -- Iron Ingot
	if smelter_recipe_name == recipe.name then
		smelter_recipe = recipe
		break
	end
end
print(smelter_recipe,smelter_recipe.name) -- Class<Recipe> 철 주괴 -- Iron Ingot

-- setRecipes for all smelters.
for n=1,#smelter_table do
	success = 0
	smelter_table[n]:setRecipe(smelter_recipe, success)
	print(n, success) -- 1 0
end
