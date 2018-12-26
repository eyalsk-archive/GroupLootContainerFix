local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self)
    GroupLootContainer:EnableMouse(false)
    frame:UnregisterEvent("PLAYER_LOGIN")
end)

UIParent:HookScript("OnEvent", function(self, event, ...)
    if event == "SPELL_CONFIRMATION_TIMEOUT" then
		local _, confirmType = ...
        if confirmType == LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL then 
            if not InCombatLockdown() then GroupLootContainer:Hide() end
        end
    end
end)