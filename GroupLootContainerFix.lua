local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("SPELL_CONFIRMATION_PROMPT")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        GroupLootContainer:EnableMouse(false)
    elseif event == "SPELL_CONFIRMATION_PROMPT" then
        local _, confirmType = ...
        if not InCombatLockdown() and confirmType == LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL then
            local indices = {}
            local maxIndex = 0
            local container = GroupLootContainer
            for index, frame in pairs(container.rollFrames) do
                indices[frame] = index
                maxIndex = max(maxIndex, index)
                --print(event, "1st", frame, frame:GetName(), maxIndex, index)
            end
            local index = 0
            for i = 1, maxIndex do
                local frame = container.rollFrames[i]
                if i == indices[frame] then
                    index = index + 1
                    --print(event, "2nd", frame, frame:GetName(), index, i, container.reservedSize * (index-1 + 0.5))
                    frame:ClearAllPoints()
                    frame:SetPoint("CENTER", container, "BOTTOM", 0, container.reservedSize * (index-1 + 0.5))
                end
            end
            --print(event, "3nd", index, container.reservedSize * index)
            if index > 0 then
                container:SetHeight(container.reservedSize * index)
                container:Show()
            else
                container:Hide()
            end
        end
    end 
end)