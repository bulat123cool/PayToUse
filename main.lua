local url = "robloxchecker1.mem4bulat.workers.dev"
local secret_key = "no key"
if game.Players.LocalPlayer.StarterGear:FindFirstChild("Settings") then
    if game.Players.LocalPlayer.StarterGear:FindFirstChild("Settings"):FindFirstChild("Key") then
        secret_key = game.Players.LocalPlayer.StarterGear:FindFirstChild("Settings"):FindFirstChild("Key").Value
    end
end
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local localPlayer = Players.LocalPlayer
local userId =  game.Players.LocalPlayer.UserId
local placeId = game.PlaceId
local payload = {
    userId = userId,
    key = secret_key,
    placeId = placeId
}
local json_body = HttpService:JSONEncode(payload)
local success, response = pcall(function()
    return request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = json_body
    })
end)
if success and response then
    if response.StatusCode == 200 then
        local serverCode = response.Body
        local chunk, err = loadstring(serverCode)
        if chunk then
            local executeSuccess, executeError = pcall(chunk)
        end
    end
end
