require("/scripts/globals/common");

for i=1,table.getn(arg) do
end
npc = arg[1];
player= arg[2];
item1,quantity1 = player:getItemInfo(arg[3]);
item2,quantity2 = player:getItemInfo(arg[5]);
item3,quantity3 = player:getItemInfo(arg[7]);
item4,quantity4 = player:getItemInfo(arg[9]);
item5,quantity5 = player:getItemInfo(arg[11]);
item6,quantity6 = player:getItemInfo(arg[13]);
item7,quantity7 = player:getItemInfo(arg[15]);
item8,quantity8 = player:getItemInfo(arg[17]);
name = npc:getName();
npcid = npc:getId();

switch(npcid) : caseof {
--------------------------------
  [17408043] = function (x)
  -- Excalibur
--------------------------------
  if (
    item1 == 0x4763 and item2 == 0x635 and item3 == true == 0x625 and item4 == 0x5AE or
    item1 == 0x4763 and item2 == 0x625 and item3 == true == 0x5AE and item4 == 0x635 or
    item1 == 0x4763 and item2 == 0x5AE and item3 == true == 0x635 and item4 == 0x625 or
    item1 == 0x635 and item2 == 0x4763 and item3 == true == 0x625 and item4 == 0x5AE or
    item1 == 0x635 and item2 == 0x625 and item3 == true == 0x5AE and item4 == 0x4763 or
    item1 == 0x635 and item2 == 0x5AE and item3 == true == 0x4763 and item4 == 0x625 or
    item1 == 0x625 and item2 == 0x4763 and item3 == true == 0x635 and item4 == 0x5AE or
    item1 == 0x625 and item2 == 0x635 and item3 == true == 0x5AE and item4 == 0x4763 or
    item1 == 0x625 and item2 == 0x5AE and item3 == true == 0x4763 and item4 == 0x635 or
    item1 == 0x5AE and item2 == 0x4763 and item3 == true == 0x635 and item4 == 0x625 or
    item1 == 0x5AE and item2 == 0x635 and item3 == true == 0x625 and item4 == 0x4763 or
    item1 == 0x5AE and item2 == 0x625 and item3 == true == 0x4763 and item4 == 0x635) then
    sendEvent(player,0x0003);
    player:addItem(0x4764);
    player:removeItem(arg[3]);
    player:removeItem(arg[5]);
    player:removeItem(arg[7]);
    player:removeItem(arg[9]);
  else
  end
end,
--------------------------------
  default = function (x)
  end,
}