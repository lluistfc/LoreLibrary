--
-- Created by IntelliJ IDEA.
-- User: Zebrah
-- Date: 16/05/2016
-- Time: 1:23
-- To change this template use File | Settings | File Templates.
--
--------------------------------------------------------------------------------
-- INITIALIZATIONS
--------------------------------------------------------------------------------
local AceGUI = LibStub("AceGUI-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("LoreLibrary", true)
LoreLibrary = LibStub("AceAddon-3.0"):NewAddon("LoreLibrary", "AceConsole-3.0")



--------------------------------------------------------------------------------
-- LoreLibrary FUNCTIONS
--------------------------------------------------------------------------------

function LoreLibrary:LoreLibraryMainFrame(input)
    local frame = AceGUI:Create("Frame")
    frame:SetTitle('Lore Library')
    for bookTitle, bookData in pairs(BibliophileDB['enUS']) do
        local button = AceGUI:Create("Button")
        button:SetText(bookTitle)
        button:SetWidth(200)
        frame:AddChild(button)
    end
    frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
    frame:SetLayout("Fill")
end

--------------------------------------------------------------------------------
-- ACE3 DB INITIALIZATION
--------------------------------------------------------------------------------
function LoreLibrary:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("BibliophileDB")
end


--------------------------------------------------------------------------------
-- ACE3 REGISTER SLASH COMMANDS
--------------------------------------------------------------------------------
LoreLibrary:RegisterChatCommand("ll", "LoreLibraryMainFrame")

