---------------------
--- NPC: Laillera ----------
--- Area: West Ronfaure -------
--- Created by: Raiendel ------
--- 11/20/2008 - Complete -------
---------------------
-- NPC Required
require("/scripts/globals/common");


for i = 1,table.getn(arg) do
end; 
---------------------
-- Variables --------------
---------------------
npc		=		arg[1];
player		=		arg[2];
npcID		=		getNPCId(npc);
charID		=		player:getId();
--------------------
-- Construct ---------------
--------------------
--print(npc);
--print(npcID);
--------------------
-- Functions ---------------
--------------------
function onTrigger(player,npc)
player:showText(npc,849);
end;-------------End Funct.-