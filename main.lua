if timer == nil then
    timer = createTimer(nil, false)
end
timer.Interval = 10
timer.OnTimer = function(timer)
    local isHit = readInteger("isHit")
    if isHit == 1 then
        taunt()
        Sleep(10)
        writeInteger("isHit", 0)
    end
end

if hotKey then
    hotKey.destroy()
end
hotKey =
    createHotkey(
    function()
        timer.Enabled = not timer.Enabled
        if timer.Enabled then
            message("Practice mode enabled.")
        else
            message("Practice mode disabled.")
        end
    end,
    VK_F5
)

function message(msg)
    print(msg)
    speak(msg)
end

function taunt()
    local i = math.random(1, table.getn(taunts))
    speak(taunts[i])
end
taunts = {
    "Wow, you died.",
    "You died, bitch.",
    "Git good.",
    "Thanks Obomuh",
    "That looks like it hurt."
}
