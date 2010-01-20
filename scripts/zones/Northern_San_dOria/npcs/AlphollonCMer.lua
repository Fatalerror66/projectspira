-----------------------------------
--	Author: Tenjou
-- 	Alphollon C Meriard
-- 	Purifies cursed items with their corresponding abjurations.
-----------------------------------

function getReward(item) --Just to quickly identify uncursed items.
switch (item) : caseof {
	[0x540] = function(x) reward = 0x366e; end; --Shura Zunari Kabuto
	[0x541] = function(x) reward = 0x366f; end; --Shura Zunari Kabuto +1
	[0x542] = function(x) reward = 0x3833; end; --Shura Togi
	[0x543] = function(x) reward = 0x3834; end; --Shura Togi +1
	[0x544] = function(x) reward = 0x39e5; end; --Shura Kote
	[0x545] = function(x) reward = 0x39e6; end; --Shura Kote +1
	[0x546] = function(x) reward = 0x37df; end; --Shura Haidate
	[0x547] = function(x) reward = 0x37e0; end; --Shura Haidate +1
	[0x548] = function(x) reward = 0x3768; end; --Shura Sune-Ate
	[0x549] = function(x) reward = 0x3769; end; --Shura Sune-Ate +1
	[0x54a] = function(x) reward = 0x308d; end; --Adaman Celata
	[0x54b] = function(x) reward = 0x3664; end; --Armada Celata
	[0x54c] = function(x) reward = 0x310d; end; --Adaman Hauberk
	[0x54d] = function(x) reward = 0x3823; end; --Armada Hauberk
	[0x54e] = function(x) reward = 0x318d; end; --Adaman Mufflers
	[0x54f] = function(x) reward = 0x39e0; end; --Armada Mufflers
	[0x550] = function(x) reward = 0x320d; end; --Adaman Breeches
	[0x551] = function(x) reward = 0x37d8; end; --Armada Breeches
	[0x552] = function(x) reward = 0x328d; end; --Adaman Sollerets
	[0x553] = function(x) reward = 0x375f; end; --Armada Sollerets
	[0x554] = function(x) reward = 0x3634; end; --Zenith Crown
	[0x555] = function(x) reward = 0x3635; end; --Zenith Crown +1
	[0x556] = function(x) reward = 0x35db; end; --Dalmatica
	[0x557] = function(x) reward = 0x35dc; end; --Dalmatica +1
	[0x558] = function(x) reward = 0x36b6; end; --Zenith Mitts
	[0x559] = function(x) reward = 0x36b7; end; --Zenith Mitts +1
	[0x55a] = function(x) reward = 0x37a7; end; --Zenith Slacks
	[0x55b] = function(x) reward = 0x37a8; end; --Zenith Slacks +1
	[0x55c] = function(x) reward = 0x372b; end; --Zenith Pumps
	[0x55d] = function(x) reward = 0x372c; end; --Zenith Pumps +1
	[0x55e] = function(x) reward = 0x3085; end; --Koenig Schaller
	[0x55f] = function(x) reward = 0x3657; end; --Kaiser Schaller
	[0x560] = function(x) reward = 0x3105; end; --Koenig Cuirass
	[0x561] = function(x) reward = 0x3822; end; --Kaiser Cuirass
	[0x562] = function(x) reward = 0x3185; end; --Koenig Handschuhs
	[0x563] = function(x) reward = 0x36ed; end; --Kaiser Handschuhs
	[0x564] = function(x) reward = 0x3205; end; --Koenig Diechlings
	[0x565] = function(x) reward = 0x37cb; end; --Kaiser Diechlings
	[0x566] = function(x) reward = 0x3285; end; --Koenig Schuhs
	[0x567] = function(x) reward = 0x3753; end; --Kaiser Schuhs
	[0x568] = function(x) reward = 0x3654; end; --Crimson Mask
	[0x569] = function(x) reward = 0x3655; end; --Blood Mask
	[0x56a] = function(x) reward = 0x381f; end; --Crimson Scale Mail
	[0x56b] = function(x) reward = 0x3820; end; --Blood Scale Mail
	[0x56c] = function(x) reward = 0x36ea; end; --Crimson Finger Gauntlets
	[0x56d] = function(x) reward = 0x36eb; end; --Blood Finger Gauntlets
	[0x56e] = function(x) reward = 0x37c8; end; --Crimson Cuisses
	[0x56f] = function(x) reward = 0x37c9; end; --Blood Cuisses
	[0x570] = function(x) reward = 0x3750; end; --Crimson Greaves
	[0x571] = function(x) reward = 0x3751; end; --Blood Greaves
	[0x572] = function(x) reward = 0x3667; end; --Hecatomb Cap
	[0x573] = function(x) reward = 0x3668; end; --Hecatomb Cap +1
	[0x574] = function(x) reward = 0x382a; end; --Hecatomb Harness
	[0x575] = function(x) reward = 0x382b; end; --Hecatomb Harness +1
	[0x576] = function(x) reward = 0x36fc; end; --Hecatomb Mittens
	[0x577] = function(x) reward = 0x36fd; end; --Hecatomb Mittens +1
	[0x578] = function(x) reward = 0x37e4; end; --Hecatomb Subligar
	[0x579] = function(x) reward = 0x37e5; end; --Hecatomb Subligar +1
	[0x57a] = function(x) reward = 0x3764; end; --Hecatomb Leggings
	[0x57b] = function(x) reward = 0x3765; end; --Hecatomb Leggings +1
	[0x987] = function(x) reward = 0x3ef1; end; --Shadow Helm
	[0x988] = function(x) reward = 0x3ef2; end; --Valkyrie's Helm
	[0x989] = function(x) reward = 0x38ed; end; --Shadow Breastplate
	[0x98a] = function(x) reward = 0x38ee; end; --Valkyrie's Breastplate
	[0x98b] = function(x) reward = 0x3a93; end; --Shadow Gauntlets
	[0x98c] = function(x) reward = 0x3a94; end; --Valkyrie's Gauntlets
	[0x98d] = function(x) reward = 0x3d27; end; --Shadow Cuishes
	[0x98e] = function(x) reward = 0x3d28; end; --Valkyrie's Cuishes
	[0x98f] = function(x) reward = 0x3d7c; end; --Shadow Sabatons
	[0x990] = function(x) reward = 0x3d7d; end; --Valkyrie's Sabatons
	[0x991] = function(x) reward = 0x3ef3; end; --Shadow Hat
	[0x992] = function(x) reward = 0x3ef4; end; --Valkyrie's Hat
	[0x993] = function(x) reward = 0x38ef; end; --Shadow Coat
	[0x994] = function(x) reward = 0x38f0; end; --Valkyrie's Coat
	[0x995] = function(x) reward = 0x3a95; end; --Shadow Cuffs
	[0x996] = function(x) reward = 0x3a96; end; --Valkyrie's Cuffs
	[0x997] = function(x) reward = 0x3d29; end; --Shadow Trews
	[0x998] = function(x) reward = 0x3d2a; end; --Valkyrie's Trews
	[0x999] = function(x) reward = 0x3d7e; end; --Shadow Clogs
	[0x99a] = function(x) reward = 0x3d7f; end; --Valkyrie's Clogs
	[0x108a] = function(x) reward = 0x11a1; end; --Amrita
	[0x108b] = function(x) reward = 0x119f; end; --Ambrosia
default = function (x) end; }
return reward;
end;
 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc)
player:startEvent(Event(0x2cf)) 
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
if (trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1) then 
	player:specialMessage(1767) 
end 

count = trade:getItemCount();

if (count == 2) then
	abj = 0;
	item = 0;
	
	for i=0x522,0x53f do --Check for Zilart abjuration-cursed item pairs.
		if (trade:hasItemQty(i,1)) then
			abj = i;
			if (trade:hasItemQty((i+30+(i-0x522)),1)) then --NQ cursed item
				item = (i+30+(i-0x522));
			elseif (trade:hasItemQty((i+31+(i-0x522)),1)) then --HQ cursed item
				item = (i+31+(i-0x522));
			end
		end
	end
	
	for j=0x97d,0x986 do --Check for Einherjar abjuration-cursed item pairs.
		if (trade:hasItemQty(j,1)) then
			abj = j;
			if (trade:hasItemQty((j+10+(j-0x97d)),1)) then --NQ cursed item
				item = (j+10+(j-0x97d));
			elseif (trade:hasItemQty((j+11+(j-0x97d)),1)) then --HQ cursed item
				item = (j+11+(j-0x97d));
			end
		end
	end
	
	for k=0x5a1,0x5a2 do --Finally, check for cursed drink or cursed beverage.
		if (trade:hasItemQty(k,1)) then
			abj = k;
			if (trade:hasItemQty((k+2793),1)) then
				item = (k+2793);
			end
		end
	end
	
	if (item ~= 0) then
		--Trade pair for a nice reward.
		trade:isComplete();
		event0x2d0 = Event(0x2d0);
		reward = getReward(item);
		event0x2d0:setParams(item,reward);
		player:startEvent(event0x2d0);
		player:addItem(reward);
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
