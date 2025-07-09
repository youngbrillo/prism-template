---@class Kick : Action
local Kick = prism.Action:extend("KickAction")
Kick.name = "Kick"
Kick.targets = {KickTarget}

Kick.requiredComponents = {
   prism.components.Controller
}
function Kick:canPerform(level)
   return true
end

local mask = prism.Collision.createBitmaskFromMovetypes{ "fly" }

--- @param level Level
--- @param kicked Actor
function Kick:perform(level, kicked)
   local direction = (kicked:getPosition() - self.owner:getPosition())

   for _ = 1, 3 do
      nextpos = kicked:getPosition() + direction

      if not level:getCellPassable(nextpos.x, nextpos.y, mask) then break end
      if not level:hasActor(kicked) then break end

      level:moveActor(kicked, nextpos)
   end
end
return Kick
