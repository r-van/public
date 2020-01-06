-- opensecurity RFID scanner, which should intercept RFID card data in a 4 chunk radius
-- logging still broken, but does properly handle ctrl+c breaks

local component = require("component")
local event = require "event"
local shell = require "shell"
local io = require "io"

local rfidata = {}
local filepath = shell.getWorkingDirectory()

local logFile = io.open(filepath.."/rfid.log", "a")
print("\nBeginning RFID harvest...\n")

local function startScript()
  os.sleep(1)
  rfidata = component.os_rfidreader.scan(64)
  for k,v in pairs(rfidata[1]) do
    print(k, v)
    if not rfidata[0] then
      goto continue
    end
    logFile.write(k, " ", v, "\n")
    ::continue::
  end
end


local state, reason = pcall(function()
  while true do
    startScript()
  end
end)

if not state then
  print("\nHarvester stopped...\n")
  logFile:close()
end
