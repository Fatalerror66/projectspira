-----------------------------------
--	Author: ReaperX
-- 	Ironbound Gate(s)
-- 	Aht Urgan Whitegate shortcuts into Wajaom Woodlands and Bhaflau Thickets
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");


function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
--print("Ironbound Gate Triggeered:",npcname);
--print("NPC ID:",npcid);

z = player:getZPos()
if (z > 0) then        -- we are at the north gate
  event=Event(0x0082);
else
  event=Event(0x0083);
end

player:startEvent(event);
end -- of on trigger function
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
z = player:getZPos()
if (option == 1) then
  if (z > 0) then
    player:setPos(570.5,-10.5,140,128,0x34);  -- -> Bhaflau Thickets, at southeastern tower
  else
    player:setPos(690,-18.5,220,128,0x33);    -- -> Wajaom Woodlands, at northeastern tower
  end
end;
end; -- onEventFinish
