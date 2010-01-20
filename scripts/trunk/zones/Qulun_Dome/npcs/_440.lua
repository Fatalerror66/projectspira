-----------------------------------
--	Author: ReaperX
-- 	_440 (door to Magicite room)
-- 	Magicite Mission
--  Door opens when you have the three key items and stand close enough 
--  (otherwise they just 'glow faintly')

-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
has_silver_bell = player:hasKeyItem(0x2D);
has_coruscant_rosary = player:hasKeyItem(0x2E);
has_black_matinee_necklace = player:hasKeyItem(0x2F);

if (has_silver_bell+has_coruscant_rosary+has_black_matinee_necklace == 3) then
  z = player:getZPos();
  if (z < -7.2) then  -- in front of the door
    player:startEvent(Event(0x33));
  else
    player:startEvent(Event(0x32));
  end
else
  player:specialMessage(795); -- A door... It seems to be locked by powerful magic.
end
end 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if ((csid == 0x32) or (csid == 0x33)) and (option == 1) then
  --print("Here");
  player:specialMessage(796,0x2D,0x2E,0x2F);
end
end;