--- @class Fall : Action
--- @overload fun(owner: Actor): Fall
local Fall = prism.Action:extend "Fall"

function Fall:perform(level)
--    level:removeActor(self.owner) -- into the depths with you!
    level:perform(prism.actions.Die(self.owner))
end

function Fall:canPerform(level)
    local x, y = self.owner:getPosition():decompose()
    local cell = level:getCell(x, y)

    -- cell has the void component
    if not cell:has(prism.components.Void) then return false end

    -- can't move through the cell
    local cellMask = cell:getCollisionMask()
    local mover = self.owner:get(prism.components.Mover)
    local mask = mover and mover.mask or 0 -- default to immovable mask
    
    return not prism.Collision.checkBitmaskOverlap(cellMask, mask) 
end

return Fall;