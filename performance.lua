local performance = {}

function performance.store(fps, spriteCount)
    table.insert(performance, {fps = fps, spriteCount = spriteCount})
end

function performance.save()
    local file = io.open("performance.txt", "w")
    if not file then error() end
    for i, data in ipairs(performance) do
        file:write("FPS: " .. data.fps .. ", Sprite Count: " .. data.spriteCount .. "\n")
    end
    file:close()
end

return performance