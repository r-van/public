local modem = require("component").modem
local event = require "event"

local response = {}
local laddress = {}
local raddress = {}

print("\naircrack-mc 1.0\n")
print("BSSID                                   PORT")

for i=1,65535 do
  modem.broadcast(i, "H")
  response, laddress, raddress = event.pull(0.25, "modem")
  if response then
    print(raddress, i)
  end
end

print("\nScan completed.")
