-----------------------------------
--	Author: Bababooey
-- 	Scrawled Writing
--
--	Trading a goblin drink pops Moblin Wolfman.
-- 	Can pop in three locations I-9, I-11 and G-13.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
require("scripts/zones/Oldton_Movalpolos/TextIDs");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------


end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	xpos = npc:getXPos();
	ypos = npc:getYPos();
	zpos = npc:getZPos();
	rot = 187;
	
	goblinDrink = 4541;
	
	count = trade:getItemCount();
	item = trade:hasItemQty(goblinDrink,1);
	
	if(count == 1 and item) then
		player:specialMessage(CHILL_DOWN_SPINE);
		oldton = Zone(0x0B);
		oldton:spawnMob("GoblinWolfman",xpos,ypos,zpos,rot,player:getId());
		trade:isComplete();
		--TODO: NPC should depop after trade.
	end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;
