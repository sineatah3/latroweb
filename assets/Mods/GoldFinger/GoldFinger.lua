--- STEAMODDED HEADER
--- MOD_NAME: Gold Finger
--- MOD_ID: GoldFinger
--- MOD_AUTHOR: [Ash_K]
--- MOD_DESCRIPTION: Goldfinger mode (turning it on will reduce the gaming experience)Goldfinger mode (turning it on will reduce the gaming experience)
--- PREFIX: gf

----------------------------------------------
------------MOD CODE -------------------------

function GoldFinger_mod_init()
    if G.SETTINGS.GoldFinger == nil then
        G.SETTINGS.GoldFinger = {
            goldFingerEnable = true,
            scoreRate = 1,
            initDollars = 4,
            initHands = 4,
            initDiscards = 4,
            initJokerSlots = 5,
            initHandSize = 8,
            initConsumableSlots = 2,
        }
    end
end


function get_starting_params()
    return {
        dollars = not G.SETTINGS.GoldFinger.goldFingerEnable and 4 or math.floor(G.SETTINGS.GoldFinger.initDollars),
        hand_size = not G.SETTINGS.GoldFinger.goldFingerEnable and 8 or math.floor(G.SETTINGS.GoldFinger.initHandSize),
        discards = not G.SETTINGS.GoldFinger.goldFingerEnable and 4 or math.floor(G.SETTINGS.GoldFinger.initDiscards),
        hands = not G.SETTINGS.GoldFinger.goldFingerEnable and 4 or math.floor(G.SETTINGS.GoldFinger.initHands),
        reroll_cost = 5,
        joker_slots = not G.SETTINGS.GoldFinger.goldFingerEnable and 5 or math.floor(G.SETTINGS.GoldFinger.initJokerSlots),
        ante_scaling = 1,
        consumable_slots = not G.SETTINGS.GoldFinger.goldFingerEnable and 2 or math.floor(G.SETTINGS.GoldFinger.initConsumableSlots),
        no_faces = false,
        erratic_suits_and_ranks = false,
        cine_quest_slots = 1
    }
end

G.FUNCS.reset_GoldFinger_defualt_settings = function(e)
    G.SETTINGS.GoldFinger = {
        scoreRate = 1,
        initDollars = 4,
        initHands = 4,
        initDiscards = 4,
        initJokerSlots = 5,
        initHandSize = 8,
        initConsumableSlots = 2,
    }
end

G.FUNCS.change_goldrate = function(args)
    G.SETTINGS.GoldFinger.scoreRate = args.to_val
    G:save_settings()
end

GoldFinger_mod_init()


local settings_ref = G.UIDEF.settings_tab
function G.UIDEF.settings_tab(tab)
    local t = settings_ref(tab)

    if tab == "goldFingerEnable" then
        return {
            n = G.UIT.ROOT,
            config = { align = "cm", padding = 0.05, colour = G.C.CLEAR },
            nodes = {
                create_toggle({ label = "Open?", ref_table = G.SETTINGS.GoldFinger, ref_value = 'goldFingerEnable' }),
                create_option_cycle({
                    label = "Fractional multiplier",
                    scale = 0.8,
                    options = { 0.5, 1, 2, 4, 8, 16, 32, 100, 1000, 10000, 1000000 },
                    opt_callback =
                    'change_goldrate',
                    current_option = (
                        G.SETTINGS.GoldFinger.scoreRate == 0.5 and 1 or
                        G.SETTINGS.GoldFinger.scoreRate == 4 and 4 or
                        G.SETTINGS.GoldFinger.scoreRate == 1 and 2 or
                        G.SETTINGS.GoldFinger.scoreRate == 2 and 3 or
                        G.SETTINGS.GoldFinger.scoreRate == 8 and 5 or
                        G.SETTINGS.GoldFinger.scoreRate == 16 and 6 or
                        G.SETTINGS.GoldFinger.scoreRate == 32 and 7 or
                        G.SETTINGS.GoldFinger.scoreRate == 100 and 8 or
                        G.SETTINGS.GoldFinger.scoreRate == 1000 and 9 or
                        G.SETTINGS.GoldFinger.scoreRate == 10000 and 10 or
                        G.SETTINGS.GoldFinger.scoreRate == 1000000 and 11
                    )
                }),
                create_slider({ label = "Initial Coins", text_scale = 0.2, label_scale = 0.3, w = 8, h = 0.4, ref_table = G.SETTINGS.GoldFinger, ref_value = 'initDollars', min = 0, max = 9999 }),
                create_slider({ label = "Number of Cards Played", text_scale = 0.2, label_scale = 0.3, w = 8, h = 0.4, ref_table = G.SETTINGS.GoldFinger, ref_value = 'initHands', min = 1, max = 500 }),
                create_slider({
                    label = "Discard times", text_scale = 0.2, label_scale = 0.3,
                    w = 8,
                    h = 0.4,
                    ref_table = G.SETTINGS.GoldFinger,
                    ref_value =
                    'initDiscards',
                    min = 1,
                    max = 500
                }),
                create_slider({
                    label = "Joker slot number", text_scale = 0.2, label_scale = 0.3,
                    w = 8,
                    h = 0.4,
                    ref_table = G.SETTINGS.GoldFinger,
                    ref_value =
                    'initJokerSlots',
                    min = 1,
                    max = 500
                }),
                create_slider({
                    label = "Maximum number of hands", text_scale = 0.2, label_scale = 0.3,
                    w = 8,
                    h = 0.4,
                    ref_table = G.SETTINGS.GoldFinger,
                    ref_value =
                    'initHandSize',
                    min = 1,
                    max = 50
                }),
                create_slider({
                    label = "Maximum number of consumption slots", text_scale = 0.2, label_scale = 0.3,
                    w = 8,
                    h = 0.4,
                    ref_table = G.SETTINGS.GoldFinger,
                    ref_value =
                    'initConsumableSlots',
                    min = 1,
                    max = 500
                }),
                {
                    n = G.UIT.R,
                    config = { align = "cm", minw = 0.8, maxw = 1.5, minh = 0.6, padding = 0.05, r = 0.1, hover = true, colour = G.C.RED, button = "reset_GoldFinger_defualt_settings", shadow = true, focus_args = { nav = 'wide' } },
                    nodes = {
                        { n = G.UIT.T, config = { text = "Restore Default Settings", scale = 1.0, colour = G.C.UI.TEXT_LIGHT } }
                    }
                },
            }
        }
    end
    return t
end

--- PRIORITY: 6
--- DISPLAY_NAME: Gold Finger
--- BADGE_COLOUR: #EE1289
----------------------------------------------
------------MOD CODE END----------------------