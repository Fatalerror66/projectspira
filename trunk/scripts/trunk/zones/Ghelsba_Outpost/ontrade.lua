---------------------------------
-- To be executed on Trading with NPCs --------------
---------------------------------

require("/scripts/globals/common");


for i=1,table.getn(arg) do
end 
npc = arg[1];
player = arg[2];
---EIGHT TRADE SLOTS--
item1,quantity1 = player:getItemInfo(arg[3]);
item2,quantity2 = player:getItemInfo(arg[5]);
item3,quantity3 = player:getItemInfo(arg[7]);
item4,quantity4 = player:getItemInfo(arg[9]);
item5,quantity5 = player:getItemInfo(arg[11]);
item6,quantity6 = player:getItemInfo(arg[13]);
item7,quantity7 = player:getItemInfo(arg[15]);
item8,quantity8 = player:getItemInfo(arg[17]);

npc = (getNPCId(npc));
char = (player:getId());
lvl = (player:getMainLvl());
zone = (player:getZone());
rankp = (getRankPoints(char));
rank = (player:getRank());
sfame = (player:getFame(0));
nation = (player:getNation());
gil = (player:getCurrGil());
---------------------------------
--- Trade code here ... ---------------------
---------------------------------

--variables and diagnostic--
name = npc:getName();
npcid = npc:getId();
--print("NPC name: ",name,"\n NPC ID: ",npcid,"\n");
--print("Item1 ID: ",item1,"\n Quantity: ",quantity1);
--print("Item2 ID: ",item2,"\n Quantity: ",quantity2);
--print("Item3 ID: ",item3,"\n Quantity: ",quantity3);
--print("Item4 ID: ",item4,"\n Quantity: ",quantity4);
--print("Item5 ID: ",item5,"\n Quantity: ",quantity5);
--print("Item6 ID: ",item6,"\n Quantity: ",quantity6);
--print("Item7 ID: ",item7,"\n Quantity: ",quantity7);
--print("Item8 ID: ",item8,"\n Quantity: ",quantity8);

--NPC ENTRIES--
switch(name) : caseof {
---------------------------------
--------------------------------
default = function (x) 
end,
}

switch(npcid) : caseof {
---------------------------------
[17719384] = function (x)
--print("Trade")
---------------------------------

end,
--------------------------------
default = function (x) 
end,
}