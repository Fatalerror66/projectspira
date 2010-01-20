-----------------------------------
--	Author: ReaperX
-- 	Lantern (SE one @ E-5 bottom floor, to Sacrificial Chamber)
--  Trading rancor flame to this lights it.
--  "flavour" messages represent my best guesses.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Den_of_Rancor/settings");

function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
se = os.time()-getGlobalVar("rancor_lantern_se_last_lit");
if (se <= LANTERNS_STAY_LIT) then
  player:specialMessage(802);
else
  player:specialMessage(796);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)


count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------
item = trade:hasItemQty(1139,1); --
if (count == 1 and item) then
	se = os.time()-getGlobalVar("rancor_lantern_se_last_lit");
  --print("SE = ------ ", se, "----")
  if (se <= LANTERNS_STAY_LIT) then
    player:specialMessage(802);
  else
  	trade:isComplete();
  	player:addItem(1138) -- give player back a Rancor flame
    npc:setState(LANTERNS_STAY_LIT); -- light the lantern
    setGlobalVar("rancor_lantern_se_last_lit",os.time());
    ne = os.time()-getGlobalVar("rancor_lantern_ne_last_lit");
    nw = os.time()-getGlobalVar("rancor_lantern_nw_last_lit");
    sw = os.time()-getGlobalVar("rancor_lantern_sw_last_lit");
    --print("other lit times: ", ne, nw, sw);
    number_of_lit_lanterns = 1;
    if (ne <= LANTERNS_STAY_LIT) then
      number_of_lit_lanterns = number_of_lit_lanterns +1;
    end;
    if (nw <= LANTERNS_STAY_LIT) then
      number_of_lit_lanterns = number_of_lit_lanterns +1;
    end;
    if (sw <= LANTERNS_STAY_LIT) then
      number_of_lit_lanterns = number_of_lit_lanterns +1;
    end;
    --print("Number of Lit Lanterns : ", number_of_lit_lanterns)
    if (number_of_lit_lanterns == 1) then
      player:specialMessage(804);
    elseif (number_of_lit_lanterns == 2) then
      player:specialMessage(805);
    elseif (number_of_lit_lanterns == 3) then
      player:specialMessage(806);
    elseif (number_of_lit_lanterns == 4) then
      player:specialMessage(807);
      npc = getNPCById(17433023,0xa0) -- drop gate to Sacrificial Chamber
      npc:setState(math.min(LANTERNS_STAY_LIT-ne,LANTERNS_STAY_LIT-nw,LANTERNS_STAY_LIT-sw));       
    end;
  end
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;