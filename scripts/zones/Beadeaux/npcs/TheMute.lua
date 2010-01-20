-----------------------------------
--	Author: ChrisKara10, Almendro
--  The Mute	
--  Gives you the "Silenced" status if you touch it. It prevents the curse
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
TheCurseCollector = player:getQuestStatus(1,34);
 TCC_Mute_tempVar = player:getVar("TCC_Mute_tempVar");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if (TheCurseCollector == 1 and TCC_Mute_tempVar == 0) then
	player:setVar("TCC_Mute_tempVar",1);
end
curse = player:getStatusEffect(EFFECT_CURSE);
 mute = player:getStatusEffect(EFFECT_MUTE);
if( mute == nil )then
	player:addStatusEffect(EFFECT_MUTE,1,0,300);
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 