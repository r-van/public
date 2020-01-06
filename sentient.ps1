

# 505 - Ruse War Field
# 510 - Gian Point
# 550 - Nsu Grid
# 551 - Ganalen's Grave
# 552 - Rya
# 553 - Flexa
# 554 - H-2 Cloud
# 555 - R-9 Cloud

while($true)
{
    write-host $(get-date -uformat %r) $(Invoke-RestMethod -uri "http://content.warframe.com/dynamic/worldState.php").tmp
    start-sleep -seconds 300
}
