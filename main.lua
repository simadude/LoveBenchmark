require "options"
-- local performance = require "performance"
OPTIMIZED = math.max(math.min(OPTIMIZED, 2), 0)
local load, update, draw, mousepress = unpack(require(string.format("opt%s", OPTIMIZED)))

function love.mousepressed(x, y, button)
    mousepress(x, y, button)
end

function love.load()
    love.window.setMode(WIN_W, WIN_H, {vsync = false})
    load()
end

local drawtime = 0
local updatetime = 0
local savetime = 0

function love.update(dt)
    savetime = savetime + dt
    local t = love.timer.getTime()
    update(dt)
    updatetime = love.timer.getTime() - t
end

function love.draw()
    local t = love.timer.getTime()

    local spritecount = draw()

    drawtime = love.timer.getTime() - t

    local fps = love.timer.getFPS()

    -- if savetime >= 1 then
    --     performance.store(fps, spritecount)
    --     savetime = 0
    -- end

    love.graphics.setColor(0.2, 0.2, 0.2)
    love.graphics.rectangle("fill", 0, 0, 500, 120)
    love.graphics.setColor(0.2, 1, 0.2)
    love.graphics.printf(string.format("FPS: %s      SPRITES:%s  Opt:%s", fps, spritecount, OPTIMIZED), 1, 0, 1000, "left", 0, 2)
    love.graphics.printf(string.format("draw  time : %sms", drawtime*1000), 1, 40, 1000, "left", 0, 2)
    love.graphics.printf(string.format("update time: %sms", updatetime*1000), 1, 80, 1000, "left", 0, 2)
    love.graphics.setColor(1, 1, 1)
end

function love.quit()
    -- performance.save()
end