local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Player = game.Players.LocalPlayer
local Window = WindUI:CreateWindow({
    Title = "DarknessHub", -- UI Title
    Icon = "rbxassetid://10511856020", -- Url or rbxassetid or lucide
    Author = "Groovy", -- Author & Creator
    Folder = "DKHub", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(230, 230), -- UI Size
    KeySystem = { -- Creates key system
        Key = "DHOnTop", -- key
        Note = "Join Our Discord To Get The Key!", -- Note
        URL = "https://github.com/Footagesus/WindUI", -- URL To get key (example: Discord)
        SaveKey = true, -- Saves the key in the folder specified above
    }, 
    Transparent = false,-- UI Transparency
    Theme = "Dark", -- UI Theme
    SideBarWidth = 170, -- UI Sidebar Width (number)
    HasOutline = true, -- Adds Outlines to the window
})

Window:EditOpenButton({
    Title = "Open Button",
    Icon = "door-closed",
    CornerRadius = UDim.new(0,10),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    )
})

local Notification = WindUI:Notify({
    Title = "Logged in successful!",
    Content = "You Are Logged In As "..Player.Name..".",
    Duration = 5,
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house", -- lucide or rbxassetid
})

local Paragraph = Tab:Paragraph({
    Title = "Thanks For Using DarknessHub!",
    Desc = "Enjoy!",
    Image = "droplet", -- lucide or URL or rbxassetid://
    ImageSize = 20,
    Buttons = {
        {
            Title = "Discord",
            Callback = function() print("Dc") end
        },
        {
            Title = "Tiktok",
            Callback = function() print("Tt") end
        },
        {
            Title = "Youtube",
            Callback = function() print("Yt") end
        }
    }
})

-- Server Hopper Button
Tab:Button({
    Title = "Server Hopper",
    Desc = "Move To New Server! | Please Wait..",
    Callback = function()
        _G.AutoRejoin = false
        Hop()
})
local Button = Tab:Button({
    Title = "Lower ServerHop",
    Desc = "Move To Lower Server | Please Wait...",
    Callback = function()
        _G.AutoRejoin = false
        getgenv().AutoTeleport = true
        getgenv().DontTeleportTheSameNumber = true 
        getgenv().CopytoClipboard = false
        if not game:IsLoaded() then
            print("Game is loading waiting...")
        end
        local maxplayers = math.huge
        local serversmaxplayer;
        local goodserver;
        local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" 
        function serversearch()
            for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
                    serversmaxplayer = v.maxPlayers
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end       
        end
function getservers()
            serversearch()
            for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                if i == "nextPageCursor" then
                    if gamelink:find("&cursor=") then
                        local a = gamelink:find("&cursor=")
                        local b = gamelink:sub(a)
                        gamelink = gamelink:gsub(b, "")
                    end
                    gamelink = gamelink .. "&cursor=" ..v
                    getservers()
                end
            end
        end 
getservers()
        if AutoTeleport then
            if DontTeleportTheSameNumber then 
                if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                    return warn("It has same number of players (except you)")
                elseif goodserver == game.JobId then
                    return warn("Your current server is the most empty server atm") 
                end
            end
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
        end
      end    
})
})

local Button = Tab:Button({
    Title = "Rejoin",
    Desc = "Join this server again | Please Wait...",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
      end    
})

local Input = Tab:Input({
    Title = "Teleport to Server Webhook",
    Desc = "Enter the server ID to teleport.",
    Callback = function(serverId)
        -- Ensure the serverId is provided
        if serverId and serverId ~= "" then
            _G.Job = Value 
_G.AutoRejoin = false
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
    end    
            -- Check if the teleportation was successful
            if success then
                print("Teleportation successful to server ID: " .. serverId)
            else
                warn("Teleportation failed: " .. message)
            end
        else
            warn("Please enter a valid server ID.")
        end
    end,
})

local FreeScriptTab = Window:Tab({
    Title = "Free Script",
    Icon = "scroll-text", -- Ganti dengan ikon yang sesuai jika perlu
})

local Section = FreeScriptTab:Section({
    Title = "Script Bloxfruit Leaked",
    TextXAlignment = "Center", -- Mengatur teks agar berada di tengah
    TextSize = 17, -- Default Size
})

local Button = FreeScriptTab:Button({
    Title = "BlackTrap Keyless",
    Desc = "Injects the BlackTrap script without a key.",
    Callback = function()
        -- Menggunakan pcall untuk menangani kesalahan saat menginject skrip
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://you.whimper.xyz/sources/btteam/BloxFruits.lua"))()
        end)

        -- Menangani kesalahan jika ada
        if success then
            print("Script injected successfully!")
        else
            warn("Failed to inject script: " .. err)
        end
    end,
})

local Button = FreeScriptTab:Button({
    Title = "Cokkahub Keyless",
    Desc = "Injects the CokkaHub script without a key.",
    Callback = function()
        -- Menggunakan pcall untuk menangani kesalahan saat menginject skrip
        local success, err = pcall(function()
            loadstring(game:HttpGet("y.txt"))()
        end)

        -- Menangani kesalahan jika ada
        if success then
            print("Script injected successfully!")
        else
            warn("Failed to inject script: " .. err)
        end
    end,
})
local Button = FreeScriptTab:Button({
    Title = "Idkhub Keyless",
    Desc = "Injects the anonymousHub script without a key.",
    Callback = function()
        -- Menggunakan pcall untuk menangani kesalahan saat menginject skrip
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/berhddb/GOGOHUB_Bloxfruits_Dragon_Update/refs/heads/main/README.md"))()
        end)

        -- Menangani kesalahan jika ada
        if success then
            print("Script injected successfully!")
        else
            warn("Failed to inject script: " .. err)
        end
    end,
})
local Button = FreeScriptTab:Button({
    Title = "Redzhub Keyless",
    Desc = "Injects the CokkaHub script without a key.",
    Callback = function()
        -- Menggunakan pcall untuk menangani kesalahan saat menginject skrip
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.luaING123%20only%20key.txt"))()
        end)

        -- Menangani kesalahan jika ada
        if success then
            print("Script injected successfully!")
        else
            warn("Failed to inject script: " .. err)
        end
    end,
})

local Section = FreeScriptTab:Section({
    Title = "Script Kinglegacy Leaked",
    TextXAlignment = "Center", -- Mengatur teks agar berada di tengah
    TextSize = 17, -- Default Size
})

-- Membuat tab untuk Misc
local MiscTab = Window:Tab({
    Title = "Misc",
    Icon = "cog", -- Ikon tab
})

-- Fungsi untuk menggunakan kode
local function UseCode(Text)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end

-- Tombol untuk menebus semua kode
local button = MiscTab:Button({
    Title = "Redeem All Code",
    Desc = "2x exp code",
    Callback = function()
        -- Daftar kode yang akan ditebus
        local codes = {
            "Sub2Fer999",
            "Enyu_is_Pro",
            "Magicbus",
            "JCWK",
            "Starcodeheo",
            "Bluxxy",
            "THEGREATACE",
            "SUB2GAMERROBOT_EXP1",
            "StrawHatMaine",
            "Sub2OfficialNoobie",
            "SUB2NOOBMASTER123",
            "Sub2Daigrock",
            "Axiore",
            "TantaiGaming",
            "STRAWHATMAINE"
        }
        
        -- Menggunakan setiap kode dalam daftar
        for _, code in ipairs(codes) do
            UseCode(code)
        end
    end
})

local BypassTab = Window:Tab({
    Title = "Bypass",
    Icon = "shield-alert", -- lucide or rbxassetid
})

-- Toggle untuk Anti AFK
local ToggleAFK = BypassTab:Toggle({
    Title = "Anti AFK",
    Desc = "AFK bypass",
    Value = true,
    Callback = function(state)
        getgenv().AntiAFK = state -- Mengatur nilai AntiAFK sesuai dengan state toggle

        task.spawn(function()
            while wait(0.1) do
                if getgenv().AntiAFK then
                    local vu = game:GetService("VirtualUser ")
                    game:GetService("Players").LocalPlayer.Idled:connect(function()
                        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                        wait(1)
                        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    end)
                end
            end
        end)
    end,
})

-- Toggle untuk Anti Kick
local ToggleKick = BypassTab:Toggle({
    Title = "Anti Kick",
    Desc = "You won't be kicked!",
    Value = true,
    Callback = function(state)
        getgenv().AntiKickClient = state -- Mengatur nilai AntiKickClient sesuai dengan state toggle

        task.spawn(function()
            while wait() do
                if getgenv().AntiKickClient then
                    loadstring(game:HttpGet('https://gitlab.com/Sky2836/BT/-/raw/main/antikickclient'))()
                end
            end
        end)
    end,
})

local Toggle = BypassTab:Toggle({
    Title = "Anti Ban",
    Desc = "Protect your account from staff.",
    Value = true,
    Callback = function(state)
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer

        local function checkIsStaff(plr)
            -- Menunggu atribut _tag untuk ditetapkan
            local attr
            while true do
                attr = plr:GetAttribute("_tag")
                if attr ~= nil then
                    break
                end
                task.wait(0.25)
            end
            return attr < 0 or attr > 2 -- Mengembalikan true jika pemain adalah staf/admin
        end

        -- Memantau pemain yang bergabung
        players.PlayerAdded:Connect(function(plr)
            plr:GetAttributeChangedSignal("_tag"):Connect(function()
                if state and checkIsStaff(plr) then
                    -- Jika staf/admin bergabung, lakukan server hop
                    local Http = game:GetService("HttpService")
                    local TPS = game:GetService("TeleportService")
                    local Api = "https://games.roblox.com/v1/games/"
                    local _place = game.PlaceId
                    local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"

                    local function ListServers(cursor)
                        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
                        return Http:JSONDecode(Raw)
                    end

                    local Server, Next
                    repeat
                        local Servers = ListServers(Next)
                        Server = Servers.data[1]
                        Next = Servers.nextPageCursor
                    until Server

                    TPS:TeleportToPlaceInstance(_place, Server.id, localPlayer)
                end
            end)
        end)
    end,
})
