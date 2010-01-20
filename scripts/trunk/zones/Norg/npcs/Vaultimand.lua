-----------------------------------
--	Author: Arcanedemon, Bababooey
-- 	Vaultimand
-- 	Tenshodo Fame Checker
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
norgfame = player:getFameLevel(3);
--print("norg fame: ", norgfame);
-- These fame levels are approximate based on Lv4 = 900
-- Each level is currently 225 fame points until fame levels are added to the db.

if(norgfame == 9) then
	player:startEvent(Event(0x006C));
elseif(norgfame == 8) then
	player:startEvent(Event(0x006B));
elseif(norgfame == 7) then
	player:startEvent(Event(0x006A));
elseif(norgfame == 6) then
	player:startEvent(Event(0x0069));
elseif(norgfame == 5) then
	player:startEvent(Event(0x0068));
elseif(norgfame == 4) then
	player:startEvent(Event(0x0067));
elseif(norgfame == 3) then
	player:startEvent(Event(0x0066));
elseif(norgfame == 2) then
	player:startEvent(Event(0x0065));
elseif(norgfame == 1) then
	player:startEvent(Event(0x0064));
else
	player:startEvent(Event(0x0064));
end;
	
end; 
 

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
end;