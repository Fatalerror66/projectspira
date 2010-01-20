-----------------------------------
--	Author: ReaperX
-- 	???
-- 	for RDM AF quest
-----------------------------------
     OldBoots = 0xC6;
 CrawlerBlood = 0xC9;
WarlocksBoots = 14093;

require("scripts/globals/settings");
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
require("scripts/zones/Crawlers_Nest/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (player:hasKeyItem(CrawlerBlood) == 1) and (player:hasKeyItem(OldBoots) == 1) then
  player:startEvent(Event(4));
elseif (player:getVar("BOOTS_BURRIED_AT") > 0) and (os.time()-player:getVar("BOOTS_BURRIED_AT") < 200) then
  player:specialMessage(847);
elseif (player:getVar("BOOTS_BURRIED_AT") > 0) and (os.time()-player:getVar("BOOTS_BURRIED_AT") >= 200) then
  player:specialMessage(ITEM_OBTAINED,WarlocksBoots);
  player:addItem(WarlocksBoots);
  player:setVar("BOOTS_BURRIED_AT",0)
  player:completeQuest(0,85);    -- quest completed sound should play here
	player:addFame(0,SAN_FAME*AF2_FAME); -- I made up that number. I have no idea how much fame this quest should give.
else
  player:specialMessage(846);
end;
end; 
 


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
if (csid == 4) and (option == 1) then
  player:removeKeyItem(CrawlerBlood);
  player:removeKeyItem(OldBoots);
	player:setVar("BOOTS_BURRIED_AT",os.time());
	player:specialMessage(849,OldBoots,CrawlerBlood);
end;
end;