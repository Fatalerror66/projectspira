-- PACKET TYPE 0x83
-- Auto-creates sql command lines for a captured 0x83 (Guild Buy) packet 
require("scripts/packets/common");

function OnIncomingPacket(packet) 
	print("Creating Guild Shop text file")
	io.output(io.open("GuildSave.txt","a+"))
	io.write("--Start \n--Make sure to replace SHOPID with the shop ID you have chosen for this specific guild before you execute this as a SQL import \n")
	x = 0x04
		while packet:getShortAt(x + 2) ~= 0 do
			item = packet:getShortAt(x)
			qty = packet:getCharAt(x + 2)
			max = packet:getCharAt(x + 3)
			price = packet:getIntAt(x + 4)
			io.write("INSERT INTO guild_shops (`guildID`,`itemID`,`curr_price`,`curr_sellprice`,`min_price`,`max_price`,`quantity`,`max`,`daily_increase`) VALUES (SHOPID, ",item,", ",price,", ",(price/10),", ",price,", ",(price * 2),", ",qty,", ",max,", ",qty,"); \n")
			x = x + 0x08
		end	
	io.write("--Finish \n")
	io.close()
end;