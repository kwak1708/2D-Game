-- Ripple objects are small ripple animations on top of all bodies of water
ripples = {}

-- Spritesheet that ripples use
ripples.spr = sprites.environment.waterSheet

-- This is the grid that all ripple objects use for animations
local w = ripples.spr:getWidth()
local h = ripples.spr:getHeight()
ripples.grid = anim8.newGrid(64, 64, w, h)

function spawnRipple(x, y)

  local ripple = {}
  ripple.x = x
  ripple.y = y

  ripple.animation = anim8.newAnimation(ripples.grid('1-24', 1), 0.1)

  table.insert(ripples, ripple)

end

-- Updates the anim8 animation for all ripple objects
function ripples:update(dt)

  for i,r in ipairs(self) do
    r.animation:update(dt)
  end

end

-- Draws the anim8 animation for all ripple objects
function ripples:draw()

  for i,r in ipairs(self) do
    r.animation:draw(self.spr, r.x, r.y)
  end

end
