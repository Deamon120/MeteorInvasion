require "sprite"


 plane = nil 
 obstacle =  nil
 renderer = nil
isAlive = true

function love.load()

    renderer = {screenWidth = love.graphics.getWidth(), screenHeight = love.graphics.getHeight()}
    obstacle = Sprite(renderer, love.graphics.newImage("obstacle.png") , 20, 18)
    plane = Sprite(renderer, love.graphics.newImage("plane.png") , 69, 72)
    plane.x = renderer.screenWidth / 2 - plane.width /2
    plane.y = renderer.screenHeight / 2 - plane.height /2
end

function love.update(dt)
    if not isAlive then
        return
    end
    moveObstacle(dt)
        if love.keyboard.isDown("d") then
            local moveTo = plane.x + 300 * dt
            if plane.canMoveX(moveTo) then
            plane.x = moveTo
            end
        end
        if love.keyboard.isDown("a") then
            local moveTo = plane.x - 300 * dt
            if plane.canMoveX(moveTo) then
            plane.x = moveTo
            end
        end
        
        if love.keyboard.isDown("w") then
            local moveTo = plane.y - 300 * dt
            if plane.canMoveY(moveTo) then
            plane.y = moveTo
            end
        end
        if love.keyboard.isDown("s") then
            local moveTo = plane.y + 300 * dt
            if plane.canMoveY(moveTo) then
            plane.y = moveTo
            end
        end

    isAlive = not plane.isColliding(obstacle)

end

function love.draw()
    if not isAlive then
        love.graphics.print('You Die!' , 400, 100)
    end
    love.graphics.draw(plane.img, plane.x, plane.y)
    love.graphics.draw(obstacle.img, obstacle.x, obstacle.y)
end


function moveObstacle(dt)
    local futurePosX = obstacle.x + randomNumber(isPositive())
    local futurePosY = obstacle.y + randomNumber(isPositive())
    if obstacle.canMoveX(futurePosX) and obstacle.canMoveY(futurePosY) then
        obstacle.x = futurePosX
        obstacle.y = futurePosY
    end
end

function isPositive()
    return math.random() > 0.5
end

function randomNumber(isPositive)
    rand =  math.random(1, 3)
    if isPositive then
        return rand
    else
        return -rand
    end
end




        