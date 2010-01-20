-- PACKET TYPE 0x3C
-- Auto-creates sql command lines for a captured 0x3C (Shop) packet 
require("scripts/packets/common");

function OnIncomingPacket(packet) 
	print("Creating Shop text file")
	io.output(io.open("ShopSave.txt","a+"))
	io.write("--Start \n--Warning, you either need to define nation or replace it with the nation ID of the nation the shop is located in your script before this function otherwise you will get errors \nshop = player:createShop(nation); \n")
	x = 0x08
	while x < (packet:getCharAt(0x01)*2) do
			price = packet:getIntAt(x)
			item = packet:getShortAt(x + 4)
			io.write("shop:addItem(",item,",(",price,"*SHOP_PRICE)); \n")
			x = x + 0x08
		end	
	io.write("player:sendShop(shop); \n--Finish \n")
	io.close()
end;