# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Step 0: preparing seeds ..."

p "Step 1: deleting database"
CustomerOrder.delete_all
SupplierOrder.delete_all
Product.delete_all
Brand.delete_all
Franchise.delete_all

p "Step 2: creating franchises"
franchises = ["Attack on Titan", "Dragon Ball", "Dragon Ball Z", "Resident Evil", "One Piece", "Naruto", "Street Fighter", "Final Fantasy", "Nier Automata", "Neo Genesis Evangelion", "Overwatch", "World of Warcraft", "Bloodborne", "Starcraft", "Marvel", "DC Comics", "Overlord", "Legend of Zelda", "Studio Ghibli", "Other Fantasy", "Dark Souls", "Diablo 3", "League of Legends", "Pokémon", "Resident Evil 4", "Elden Ring", "Resident Evil 3 Remake", "Bleach", "Iron Maiden", "Jujutsu Kaisen", "My Dres", "Akame Ga Kill!", "GT Studio On", "SPY x FAMILY", "Bakemonogatari", "Pokemon", "Devil May Cry 5", "SPY x FAMIL", "Infinity Studio", "Violet Evergarden", "The Darkness", "Metal Gear Solid", "King of Fighters", "Bayonetta", "Cyberpunk:Edgerunners", "Hunter x Hunter", "Great Teacher Onizuka", "Metroid", "Azur Lane", "Chainsaw Man", "Neon Genesis Evangelion", "Black Clover", "Genshin Impact", "Overwatch & LoL", "Warcraft"]
franchises.each do |fr|
  Franchise.create(title: fr)
end

p "Step 3: creating brands"
brands = ["Sky Top Studio", "Blue Sky Studio", "BJ Studio", "Harem Studio", "JOY Station", "Dream Studio", "Cartoon World", "Chikara Studio", "Last Sleep Studios", "Last Sleep Studio", "Last Sleep", "TriEagles Studio", "Pink Pink Studio", "Creation Studio", "Slap Studios", "Typical Scene Studio", "Yakuza Studio", "Hummingbird Studio", "CP Studio", "Solar Eclipse Studio", "Solar Studio", "LC Studios", "CatFish Studios", "Xiu Xing Studios", "ZZDD Studio", "Slap Studio ft ZZDD Studio", "DTalon Studio", "Bolomo Studio", "Black Wing & Blue Sky Studios", "Infinite Studio", "Faceted Pebble Studio", "MR J Studio", "Baby Face Studio", "YoYo Studio", "JOY Station Collectibles", "Mayflies Studio", "Imaginary Koncepts", "PT Studios", "MFA Collectibles", "Sunbird Studio", "HunDian Studio", "Green Leaf Studio", "Rosa Studio", "LC Studio", "YW-Studio", "Infinity Studio", "JacksDo", "Box Studio", "DT Studio", "Exoresin", "Exquisite ft. Niren Studios", "YunQi Create Studio", "Faith Art Studio", "NEO ft. O2 Studios", "MKE Studio", "Epoch Studios", "Singularity Workshop Studio", "Selection Studio", "OZ Productions Studio", "LX Studio", "KK Studio", "8 Studio", "Third Eye Studio", "RYU Studio", "XZ Studio", "Prototypez Studios", "Faceted Pebble", "Leviathan Studio", "Surge Studio", "HB Studio", "Dragon Studio", "CorgiProgKit ft. DTalon", "OPM Studio", "Ventus Studio", "OneW Studio", "Moonlight Studio", "WooTa Studio", "Leo Of Sky Studio,", "Leo of Sky Studio", "P.D. Studio", "Awakening Studio", "FE Studios", "Ein Studio ft. Evan Lee", "JH Studio", "Cartoon World Studio", "SHK Studio", "CP ft. LC Studio", "Sky Sun ft. Light Weapons Studio", "FA Studio", "Lightning Studio", "Puffer Studio", "Bigfoot Studio", "Burning Wind ft. TJ Studios", "Aries Studio", "Sculpting Soul Studio", "Monster Studio", "Scratch Studio", "Jimei Palace", "ShowMaker STUDIO", "TH STUDIO", "Evil Studio", "Four Horsemen Studio", "TR Studio", "EA Studio", "NT Studio", "YuanMeng Studio", "XM Studios", "Prime 1 Studio", "SD STUDIO", "Jorsing ft. Hot Heart", "Relive Studio", "Mayflies", "ThreeArtisan Studio", "Kidult Studio", "HobbyHouse Studio", "Hunter Fan Studio", "whalesong studio", "Gravity Studio", "Animal Universe Studio ft. Force Studio", "RWN Studio", "AO Studio", "MFC Studio | Replika", "Monat ft. 8 Studio", "Fallen Angel Studio", "DaYu Studio", "KD Collectibles", "Atlas Studio", "Treasure of Soul Mate", "Pointer Bear Studio", "Infinity Studio - Zyra", "Windseeker & Stormspace Studio", "Moonlight", "Anima Studio", "RB Studio", "Dtalon Studio ft. CORG PROGKI", "CW Studios", "Anonymous Studio", "Long Studio", "Chocobo Studio", "SHK Studios", "Epoch Studio", "Windseeker Studios", "SHE Studio", "Evil Studio x IU Studio", "Sword&Wing x Acy Studio", "Lovely Girl Studio", "Monkey D Studio", "Verve Studio", "Sun STUDIO", "Seen Studio", "Unique Art", "ABsinthe Studio", "SDZ Studio", "ACY Studio", "QBL-Studio", "Sixth magnitude Star Studio", "Hexagram Studio", "OH Studio", "UP Studio", "RD Studio", "Black Wing Studio", "Fantasy Studio", "IU Studio", "Price Fighter Studio", "Rigel 7 Studio", "CW Studio", "Coolbear Studio", "Hot Blood Studio", "Crown Studio", "Temple Studio ft. HAF", "SGS Studio", "Hunter Studio", "ZBC Studio", "TianTong Studio", "Peaky Blinders Studio", "Vlad Collectibles", "Re.Souls Studio", "Ekon Studio", "Weare A Design", "Blackwing Studio", "Temple Studio", "Whale Song Studio", "OT Studio", "Blood Joker Studio", "F4 Studio"]
brands.each do |brand|
  Brand.create(title: brand)
end