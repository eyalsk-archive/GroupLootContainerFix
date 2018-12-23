local function hide() -- Might not be needed and over-engineered and instead we can simply call :Hide() in all places but needs more testing.
    if not InCombatLockdown() then
        GroupLootContainer:Hide()
    else 
        GroupLootContainer:EnableMouse(false)
        C_Timer.After(1, hide)
    end
end

GroupLootContainer:SetScript("OnShow", function(self)
    self:EnableMouse(true)
end)

UIParent:HookScript("OnEvent", function(self, event, ...)
    if event == "SPELL_CONFIRMATION_TIMEOUT" then
		local _, confirmType = ...
		if confirmType == LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL then hide() end
    end
end)

BonusRollLootWonFrame:HookScript("OnHide", function(self)
    hide()
end)

BonusRollMoneyWonFrame:HookScript("OnHide", function(self)
    hide()
end)

hooksecurefunc("GroupLootFrame_OnShow", function(self)
    local _, name = GetLootRollItemInfo(self.rollID)
	if name == nil then hide() end
end)

hooksecurefunc("GroupLootFrame_OnEvent", function(self, event, ...)
	if event == "CANCEL_LOOT_ROLL" then
		local arg1 = ...;
		if arg1 == self.rollID then hide() end
	end
end)

hooksecurefunc("BonusRollFrame_FinishedFading", function(self)
    if self.rewardType ~= "item" 
    and self.rewardType ~= "artifact_power" 
    and self.rewardType ~= "money" 
    and self.rewardType ~= "currency" then hide() end
end)