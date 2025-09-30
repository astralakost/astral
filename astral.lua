itemID =  -- ID item yang ingin ditanam
delay =    -- Delay antar tanam (jangan kurang dari 170 kalau ngelag!)

function placeItem(id, x, y)
    sendPacketRaw(false, {
        type = 3,
        value = id,
        x = x * 32,
        y = y * 32,
        px = x,
        py = y
    })
end

function punch(x, y)
     sendPacketRaw(false, {
     type = 3,
     value = 18,
     x = x32,
     y = y32,
     px=x,
     py=y
  })
end

while true do
    local player = GetLocal()
    local x = math.floor(player.posX / 32)
    local y = math.floor(player.posY / 32)

    -- Posisi di atas karakter
    local targetY = y - 1

    -- Urutan: Kiri → Tengah → Kanan
    local positions = {x - 1, x, x + 1}

    for _, targetX in ipairs(positions) do
        -- Tanam item
        placeItem(itemID, targetX, targetY)
        punch(targetX, targetY)
        sleep(delay)
    end

    sleep(100) 
end
