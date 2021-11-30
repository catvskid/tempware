--// Temporal X Aimbot + ESP
--// Created by ProtoType32

--// "Delta" refers to the amount of degrees that the aimbot expects the camera to rotate by (while camera sensitivity is set to 1.0) when the mouse moves by one (1) pixel.
--// For example, if the delta was set to (2), that tells the aimbot that moving the mouse by one pixel on 1.0 sensitivity would rotate the camera by 2 degrees.
--// It adjusts automatically to account for different camera sensitivity settings. Aimbot is most accurate on lower sensitivities.

--!! Keep these set to (nil) if you aren't sure what they do!
local deltaX = nil -- Left/Right rotation delta
local deltaY = nil -- Up/Down rotation delta
local aimDeltaX = nil -- These delta values override the normal delta values when "gameAimButton" is being held down. Can be used for if games change camera sensitivity when aiming in.
local aimDeltaY = nil -- ^^^
local gameAimButton = nil -- Can be either an Enum.KeyCode or Enum.UserInputType
 -- Defaults to Enum.UserInputType.MouseButton2 if set to (nil)

--// I've also made a tool to automatically grab delta values here:
--// https://pastebin.com/raw/YYdL4kxh

loadstring(game:HttpGet("https://pastebin.com/raw/w2S8YyDt", true))()
