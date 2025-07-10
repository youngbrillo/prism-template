--- @class Attacker : Component
--- @field damage integer
--- @overload fun(damage: integer)
local Attacker = prism.Component:extend("Attacker")

--- @param damage integer
function Attacker:__new(damage)
    self.damage = damage
end

return Attacker