--- STEAMODDED HEADER
--- MOD_NAME: Setting Enhancement
--- MOD_ID: SettingEnhance
--- MOD_AUTHOR: [Ash_K]
--- MOD_DESCRIPTION: Settings enhancement, the specific functions are as follows: Display frame rate Switch Shader mode (can reduce GPU usage, enabled by default, will make the screen gray) Switch cheat mode (turning it on will reduce the gaming experience) Adjust font size Rendering ratio Frame rate limit

----------------------------------------------
------------MOD CODE -------------------------

function SettingEnhance_mod_init()
    if G.SETTINGS.Enhance == nil then
        G.SETTINGS.Enhance = {
            showFPS = false,
            goldFingerEnable = false,
            disableCrtShader = true,
            canvScale = 1.0,
            fontScale = 1.0,
            fpsCap = 60,
        }
    end

    G.recording_mode = G.SETTINGS.Enhance.disableCrtShader
    
    G.FONTS[2].FONTSCALE = 0.12 * G.SETTINGS.Enhance.fontScale
    G.FPS_CAP = G.SETTINGS.Enhance.fpsCap
end


G.FUNCS.reset_SettingEnhance_defualt_settings = function(e)
    G.SETTINGS.Enhance = {
        showFPS = false,
        goldFingerEnable = false,
        disableCrtShader = false,
        canvScale = 1.0,
        fontScale = 1.0,
        fpsCap = 60,
    }
    G.recording_mode = G.SETTINGS.Enhance.disableCrtShader


    G.FONTS[2].FONTSCALE = 0.12 * G.SETTINGS.Enhance.fontScale
end


G.FUNCS.change_CANV_SCALE = function(args)
    G.SETTINGS.Enhance.canvScale = args.to_val
    G:save_settings()
end

G.FUNCS.change_FPS_CAP = function(args)
    G.SETTINGS.Enhance.fpsCap = args.to_val
    G.FPS_CAP = G.SETTINGS.Enhance.fpsCap
    G:save_settings()
end
G.FUNCS.change_Font_Scale = function(args)
    G.SETTINGS.Enhance.fontScale = args.to_val
    G.FONTS[2].FONTSCALE = 0.12 * G.SETTINGS.Enhance.fontScale
    G:save_settings()
end


SettingEnhance_mod_init()


local settings_ref = G.UIDEF.settings_tab
function G.UIDEF.settings_tab(tab)
    local t = settings_ref(tab)
    if tab == 'NewBee' then
        return {
            n = G.UIT.ROOT,
            config = { align = "cm", padding = 0.05, colour = G.C.CLEAR },
            nodes = {
                create_toggle({ label = "Display FPS", ref_table = G.SETTINGS.Enhance, ref_value = 'showFPS',callback =(
                    function(_set_toggle)
                        G:save_settings()
                    end
                )  }),
                create_toggle({ label = "Whether to turn off Shader (reduce GPU usage)", ref_table = G.SETTINGS.Enhance, ref_value = 'disableCrtShader' ,callback =(
                    function(_set_toggle)
                        G.recording_mode = G.SETTINGS.Enhance.disableCrtShader
                        G:save_settings()
                    end
                )  }),

                -- G.FPS_CAP
                create_option_cycle({
                    label = "Frame rate limit (on mobile devices, you may need to turn off vertical sync to take effect)",
                    scale = 0.8,
                    options = { 30, 60, 90, 120, 144 , 180 , 500},
                    opt_callback =
                    'change_FPS_CAP',
                    current_option = (
                        G.SETTINGS.Enhance.fpsCap == 30 and 1 or
                        G.SETTINGS.Enhance.fpsCap == 60 and 2 or
                        G.SETTINGS.Enhance.fpsCap == 90 and 3 or
                        G.SETTINGS.Enhance.fpsCap == 120 and 4 or
                        G.SETTINGS.Enhance.fpsCap == 144 and 5 or
                        G.SETTINGS.Enhance.fpsCap == 180 and 6 or
                        G.SETTINGS.Enhance.fpsCap == 500 and 7
                    )
                }),
                create_option_cycle({
                    label = "Font size ratio",
                    scale = 0.8,
                    options = { 0.85, 0.95, 1.0, 1.05, 1.1, 1.15, 1.2, 1.3 ,1.5,1.8,2.0,2.5},
                    opt_callback =
                    'change_Font_Scale',
                    current_option = (
                        G.SETTINGS.Enhance.fontScale == 0.95 and 1 or
                        G.SETTINGS.Enhance.fontScale == 0.85 and 2 or
                        G.SETTINGS.Enhance.fontScale == 1.0 and 3 or
                        G.SETTINGS.Enhance.fontScale == 1.05 and 4 or
                        G.SETTINGS.Enhance.fontScale == 1.1 and 5 or
                        G.SETTINGS.Enhance.fontScale == 1.15 and 6 or
                        G.SETTINGS.Enhance.fontScale == 1.2 and 7 or
                        G.SETTINGS.Enhance.fontScale == 1.3 and 8 or
                        G.SETTINGS.Enhance.fontScale == 1.5 and 9 or
                        G.SETTINGS.Enhance.fontScale == 1.8 and 10 or
                        G.SETTINGS.Enhance.fontScale == 2.0 and 11 or
                        G.SETTINGS.Enhance.fontScale == 2.5 and 12
                    )
                }),
                create_option_cycle{
                    label = "Rendering scale (reducing it can improve performance, but will reduce image quality, restart to take effect)",
                    scale = 0.8,
                    options = { 0.2, 0.25, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.2 },
                    opt_callback = 'change_CANV_SCALE',
                    current_option = (
                        G.SETTINGS.Enhance.canvScale == 0.2 and 1 or
                        G.SETTINGS.Enhance.canvScale == 0.25 and 2 or
                        G.SETTINGS.Enhance.canvScale == 0.5 and 3 or
                        G.SETTINGS.Enhance.canvScale == 0.6 and 4 or
                        G.SETTINGS.Enhance.canvScale == 0.7 and 5 or
                        G.SETTINGS.Enhance.canvScale == 0.8 and 6 or
                        G.SETTINGS.Enhance.canvScale == 0.9 and 7 or
                        G.SETTINGS.Enhance.canvScale == 1.0 and 8 or
                        G.SETTINGS.Enhance.canvScale == 1.2 and 9
                    )
                },
                {
                    n = G.UIT.R,
                    config = { align = "cm", minw = 0.8, maxw = 1.5, minh = 0.6, padding = 0.05, r = 0.1, hover = true, colour = G.C.RED, button = "reset_SettingEnhance_defualt_settings", shadow = true, focus_args = { nav = 'wide' } },
                    nodes = {
                        { n = G.UIT.T, config = { text = "Restore Default Settings", scale = 1.0, colour = G.C.UI.TEXT_LIGHT } }
                    }
                },
            }
        }
    end

    return t
end

--- PRIORITY: 788
--- DISPLAY_NAME: Setting Enhance
--- BADGE_COLOUR: #EE1289
----------------------------------------------
------------MOD CODE END----------------------