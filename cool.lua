-- ts is a lil bit skidded lmaoo

local ReplicatedStorage = game:FindService("ReplicatedStorage")
local ChatEvents = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents")
local OnMessageEvent = ChatEvents:WaitForChild("OnMessageDoneFiltering")
local SayMessageRequest = ChatEvents:WaitForChild("SayMessageRequest")

if not SayMessageRequest:IsA("RemoteEvent") or not OnMessageEvent:IsA("RemoteEvent") then return end

local ChatLegth = require(game:FindService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings")).MaximumMessageLength
local lp = game:FindService("Players").LocalPlayer.Name

OnMessageEvent.OnClientEvent:Connect(function(data)
    if not data then return end
    local player = tostring(data.FromSpeaker)
    if player == lp then return end
    local message = tostring(data.Message)
    if (message):len() <= (ChatLegth-7) then
        SayMessageRequest:FireServer(('\"%s\"%s'):format(message,"o\239\191\180k\239\191\180a\239\191\180y\20g\239\191\180o\239\191\180\239\191\180r\239\191\180\239\191\180lo\239\191\180c\239\191\180k\20s\239\191\180t\239\191\180\239\191\180o\239\191\180\239\191\180p\20f\239\191\180u\239\191\180\239\191\180c\239\191\180\239\191\180k\239\191\180\239\191\180i\239\191\180\239\191\180n\239\191\180\239\191\180g\20t\239\191\180al\239\191\180\239\191\180ki\239\191\180\239\191\180n\239\191\180\239\191\180g\239\191\180\239\191\180"),tostring(data.OriginalChannel))
    end
end)

wait(0.1)

loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua", true))()
