-----------------------------------
--	Author: ReaperX
-- 	Rytaal
-- 	Gives out new imperial army I.D. tags, counts their number, won't give you a new tag if you already have one
--  or are on an assault mission, checks level and mercenary rank requirement.
--  Known Problems: will give tags if number of tags on server is <=0 (couldn't find input params to trigger).
--  Not implemented: time-based tag refresh.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

-- Rytaal events --------------------
-- 0x010E: "come back when you fulfil the requirements."
-- 0x010C: player satisfies the requirements.
-- 0x0BBA: ???
-----------------------------
-- debug code
--player:setVar("TAGS_ON_SERVER",0)
--player:setVar("ASSAULT_NUMBER",0);
-----------------------------

rank = player:getVar("MERCENARY_RANK")
tags_on_server = player:getVar("TAGS_ON_SERVER");
current_assault_mission = player:getVar("ASSAULT_NUMBER"); -- if this is 0, player is not currently on any assault missions.

if (rank == 0) or (player:getMainLvl()<50) then
  event = Event(0x010E);
else
  event = Event(0x010C);
  has_key_item = player:hasKeyItem(0x313);
  if (tags_on_server == 0) then
    --print("Handling for zero tags not implemented);
    --- I couldn't figure out what combination of input parameters, if any, produces the message that there are no more
    --- tags until {date and time}. tags_on_server = 0 alone doesn't do.
  end;  
  event:setParams(0, tags_on_server, current_assault_mission,has_key_item);
end

player:startEvent(event);

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);

if (option == 2) then -- player wants to cancel current assault mission
 
  player:removeKeyItem(0x2FA);
  player:removeKeyItem(0x2FB);
  player:removeKeyItem(0x2FC);
  player:removeKeyItem(0x2FD);
  player:removeKeyItem(0x2FE);
  player:removeKeyItem(0x36E);
  player:setVar("ASSAULT_NUMBER",0);
  player:addKeyItem(0x313);
  player:specialMessage(23,0x313); -- obtained key item 
 
 elseif (option == 1) then
  player:addKeyItem(0x313);
  player:specialMessage(23,0x313); -- obtained key item 
  player:setVar("TAGS_ON_SERVER",tags_on_server-1);
 end
 
end;