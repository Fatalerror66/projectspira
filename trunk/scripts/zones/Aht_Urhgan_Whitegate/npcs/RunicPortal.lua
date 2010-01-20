-----------------------------------
--	Author: ReaperX
-- 	Runic Portal
-- 	Aht Urgan Teleporter to Other Areas
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");


function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
--print("Runic Portal Triggered:",npcname);
--print("NPC ID:",npcid);

-- DEBUG functionality ----------
--player:setVar("AZOUPH_RUNIC_PORT",1); 
--player:setVar("DVUCCA_RUNIC_PORT",1);
--player:setVar("MAMOOL_RUNIC_PORT",1);
--player:setVar("HALVUNG_RUNIC_PORT",1);
--player:setVar("ILRUSI_RUNIC_PORT",1);
--player:setVar("NYZUL_RUNIC_PORT",1);
----------------------

-- Is the player on an assault mission?

leujaoam_orders = player:hasKeyItem(0x2FA);
mamool_orders = player:hasKeyItem(0x2FB);
lebros_orders = player:hasKeyItem(0x2FC);
periqia_orders = player:hasKeyItem(0x2FD);
ilrusi_orders = player:hasKeyItem(0x2FE);
nyzul_orders = player:hasKeyItem(0x36E);

if (leujaoam_orders == 1) then -- assault @ Azouph Isle
 event = Event(0x0078);
elseif (mamool_orders == 1) then -- assault @ Mamool Ja 
 event = Event(0x0079);
elseif (lebros_orders == 1) then -- assault @ Halvung
 event = Event(0x007A);
elseif (periqia_orders == 1) then -- assault @ Dvucca Isle 
 event = Event(0x007B);
elseif (ilrusi_orders == 1) then -- assault @ 	 Ilrusi Atoll 
 event = Event(0x007C);
elseif (nyzul_orders == 1) then -- assault @  Nyzul Isle
 event = Event(0x007D);
end -- if
 
-- you can only have one set of assault orders so if you have orders, their sum is 1.
assault_orders = leujaoam_orders + mamool_orders + lebros_orders + periqia_orders + ilrusi_orders + nyzul_orders;

if (assault_orders > 0) then    -- assault orders have priority over runic portal permits, so
  player:startEvent(event);      -- teleport player to assault
else

-- now we know that the player does not have an assault order.
-- teleport is permitted as long as player has the key item runic portal permit and at least one runic portal. No
-- need to check for the Astral Candescence since that is only the condition for Sharin-Garin to sell player a permit.
-- If the player has the permit, teleport is allowed even if the AC is gone.

  if (player:hasKeyItem(0x30E) == 1) then
    event = Event(0x0065);
    --print("Has Key item runic portal use permit!");
    azouph = player:getVar("AZOUPH_RUNIC_PORT");
    dvucca = player:getVar("DVUCCA_RUNIC_PORT");
    mamool = player:getVar("MAMOOL_RUNIC_PORT");
    halvung = player:getVar("HALVUNG_RUNIC_PORT");
    ilrusi = player:getVar("ILRUSI_RUNIC_PORT");
    nyzul = player:getVar("NYZUL_RUNIC_PORT");
    event:setParams(0,azouph,dvucca,mamool,halvung,ilrusi,nyzul); 
    player:startEvent(event); 
  else
    player:specialMessage(1098,0) 	 
  end -- if player has key item
end -- if player has assault orders
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
--print("CSID:",csid);
--print("RESULT:",option);
if ((option ~= 0) and ( assault_orders == 0)) then
  player:removeKeyItem(0x30E) -- remove the key item runic portal permit after unless player canceled
end;
if (option ~= 0) then         -- don't warp if the player declined
 if ((option == 1) or (leujaoam_orders == 1)) then
  player:setPos(528,-25,-483,210,0x4f) -- Azouph Isle (Leujaoam Sanctum) --
 elseif ((option == 2) or (periqia_orders == 1)) then
  player:setPos(-268,-6,-35,131,0x4f) -- Dvucca Isle (Periqia) --
 elseif ((option == 3) or (mamool_orders == 1)) then
  player:setPos(-202,-9,-806,224,0x34) -- Mamool Ja Staging Point --
 elseif ((option == 4) or (lebros_orders == 1)) then
  player:setPos(678,-24,360,90,0x3d) -- Halvung (Lebros Cavern) --
 elseif ((option == 5) or (ilrusi_orders == 1)) then
  player:setPos(22,-7.2,626,60,0x36) -- Ilrusi Atoll Staging Point --
 elseif ((option == 6) or (nyzul_orders == 1)) then
  player:setPos(223.5,-0.5,20,129,0x48) -- Nyzul Isle Staging Point --
end -- if 
end -- if
end; -- onEventFinish
