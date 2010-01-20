-- Altedour I Tavnazia
-- by ReaperX
-- WHM AF3 NM.
-- To do: depop ??? when it pops, repop ??? when it dies.
-- death message needs to be adjusted to entire party/alliance (or every char within range?) sees it.

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------
function OnMobSpawn(mob)
end;

function OnMobDeath(mob, player)
	player:showMessage(1146) -- It is finally...over... Ahh...I can... I can see... Tavnazia... The land of wind...and light.. My... My home...!
end;
