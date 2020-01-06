-- very early data sniffer, designed to intercept logins after finding open ports

local component = require "component"
local event = require "event"

local args = {...}

if #args <1 then
  print("\nPlease specify port to listen on.\n")
  return
end

print("\nSniffing wifi data on port "..args[1].."\n")

local function startScript(port)
  local a, b, c, d, e, f = {}
  a, b, c, d, e, f = event.pull("modem")    
  print(a, b, c, d, e, f)
end

local state, reason = pcall(function()
  component.modem.open(tonumber(args[1]))
  while true do
    startScript()
  end
end)

if not state then
  print("\nSniffer stopped...\n")
  component.modem.close(tonumber(args[1]))
end
