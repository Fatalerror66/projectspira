-- Variable TextID   Description text

-- General Texts
ITEM_CANNOT_BE_OBTAINED = 203;    -- You cannot obtain the item <item> come back again after sorting your inventory
          ITEM_OBTAINED = 206;    -- Obtained: <item>.
           GIL_OBTAINED = 207;    -- Obtained <number> gil.
       KEYITEM_OBTAINED = 209;    -- Obtained key item: <keyitem>.

-- offset for San d'Oria Mission 2-1 "The Rescue Drill"

RESCUE_DRILL = 1122; -- "Rescue drills in progress. Try to stay out of the way."

-- THF AF3 

THF_AF3_OFFSET = 1222 -- "Something about this patch of ground alerts your thief instincts."

--ZM Stuff

ZILART_MONUMENT = 1333; 	--Its an ancient Zilhart Monument
ALREADY_OBTAINED_FRAG = ZILART_MONUMENT-3; 	--You have already obtained this monuments...
FOUND_ALL_FRAGS = ZILART_MONUMENT-1; 	--You have obtained <frag>! You now have all 8 fragments
CANNOT_REMOVE_FRAG = ZILART_MONUMENT-4;	--It is an oddly shaped monument. A shiny stone... cannot be removed.

FireFrag = 0xEF;
WaterFrag = 0xF0;
EarthFrag = 0xF1;
WindFrag = 0xF2;
LightningFrag = 0xF3;
IceFrag = 0xF4;
LightFrag = 0xF5;