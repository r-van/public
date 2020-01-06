-- Wireless port scanner, taking advantage of the network driver arp-style host resolution protocol

local modem = require("component").modem
local event = require "event"

local response = {}
local laddress = {}
local raddress = {}

print("\naircrack-mc 1.0\n")
print("BSSID                                   PORT")

for i=1,65535 do
  -- broadcast a host announce
  modem.broadcast(i, "H")
  -- at 0.25, this is way too slow, but still trying to find the sweet spot
  response, laddress, raddress = event.pull(0.25, "modem")
  if response then
    print(raddress, i)
  end
end

print("\nScan completed.")
