local sprites = {}
local images = {}

local function newSprite(x, y)
    local sprite = {
        x = x,
        y = y,
        speedx = math.random(-SPEED, SPEED),
        speedy = math.random(-SPEED, SPEED),
        rotation = math.random()*math.pi,
        speedrotation = math.random(-SPEED, SPEED)*math.pi/180,
        imageid = math.random(1, 12),
    }
    sprites[#sprites+1] = sprite
end

local function load()
    for i = 0, 11 do
        images[#images+1] = love.graphics.newImage(string.format("sprites/%s.png", i))
    end
    newSprite(WIN_H/2, WIN_W/2)
end

local function mousepress(x, y, button)
    if button == 1 then
        for i = 1, NUM_SPRITES_PER_CLICK do
            newSprite(x, y)
        end
    elseif button == 2 then
        for i = 1, NUM_SPRITES_PER_CLICK do
            table.remove(sprites, #sprites)
        end
    end
end

local function update(dt)
    for _, sprite in ipairs(sprites) do

        if sprite.x < 0 then
            sprite.speedx = math.abs(sprite.speedx)
        elseif sprite.x > WIN_W then
            sprite.speedx = math.abs(sprite.speedx)*-1
        end

        if sprite.y < 0 then
            sprite.speedy = math.abs(sprite.speedy)
        elseif sprite.y > WIN_H then
            sprite.speedy = math.abs(sprite.speedy)*-1
        end

        sprite.x = sprite.x + sprite.speedx*dt
        sprite.y = sprite.y + sprite.speedy*dt
        sprite.rotation = sprite.rotation + sprite.speedrotation*dt
    end
end

local function draw()
    local imagewidth =  images[1]:getWidth()
    local imageheight = images[1]:getHeight()

    for _, sprite in ipairs(sprites) do
        love.graphics.draw(images[sprite.imageid],
                            sprite.x+math.cos(sprite.rotation-math.pi*3/4)*imagewidth/2*math.sqrt(2),
                            sprite.y+math.sin(sprite.rotation-math.pi*3/4)*imageheight/2*math.sqrt(2), sprite.rotation)
    end
    return #sprites
end

return {load, update, draw, mousepress}