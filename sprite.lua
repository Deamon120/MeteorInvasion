 function Sprite(renderer, _img, _width, _height)
    local self = {
        x = 0,
        y = 0,
        img = _img,
        width = _width,
        height = _height,
    }

    local _width = width
    local _height = height

    function self.isColliding(other)
        return other.x < self.x + self.width and
            other.x + other.width > self.x and
            other.y < self.y + self.height and
            other.y + other.height > self.y
    end

    function self.canMoveX(futurePosX) 
        return futurePosX > 0 and futurePosX < (renderer.screenWidth - self.width)
    end
    
    function self.canMoveY(futurePosY) 
        return futurePosY >= 0 and futurePosY < (renderer.screenHeight- self.height)
    end

    return self
end