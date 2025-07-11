---@class Die : Action
---@overload fun(owner: Actor): Die
local Die = prism.Action:extend("Die")

function Die:perform(level)
   level:removeActor(self.owner)

   if not level:query(prism.components.PlayerController):first() then
      level:yield(prism.messages.Lose());
   end
end

return Die