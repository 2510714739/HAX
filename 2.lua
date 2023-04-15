local vector = require("vector")

local ref = 
{
    antiaim = {
        anti_aim = { ui_reference("AA", "Anti-aimbot angles", "Enabled") },
        pitch = ui_reference("AA", "Anti-aimbot angles", "Pitch"),
        yaw = {ui_reference("AA", "Anti-aimbot angles", "Yaw")},
        yaw_base = ui_reference("AA", "Anti-aimbot angles", "Yaw Base"),
        jitter = { ui_reference("AA", "Anti-aimbot angles", "Yaw jitter") },
        body_yaw = { ui_reference("AA", "Anti-aimbot angles", "Body yaw") },
        fs_body_yaw = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw"),
        fake_limit = ui_reference("AA", "Anti-aimbot angles", "Fake yaw limit"),
        rollslider = ui_reference("AA", "Anti-aimbot angles", "Roll"),
        slow_motion = { ui_reference("AA", "Other", "Slow motion") },
        fd = ui_reference("RAGE", "Other", "Duck peek assist"),
    }
}

local anti_aims = {
    condition = "",
}

local helpers = {
    lp = entity_get_local_player(),
    ground_ticks = 0,
}

function helpers:handle_ground()
    local flags = entity_get_prop(helpers.lp, 'm_fFlags')
    if bit_band(flags, 1) == 0 then
        helpers.ground_ticks = 0
    elseif helpers.ground_ticks <= 5 then
        helpers.ground_ticks = helpers.ground_ticks + 1
    end
end

function helpers:is_on_ground()
    return helpers.ground_ticks >= 5
end

function anti_aims:get_condition_type()
    
    local duck_amt = entity_get_prop(helpers.lp, 'm_flDuckAmount')
    local speed = vector(entity_get_prop(helpers.lp, 'm_vecVelocity')):length()

    if not helpers:is_on_ground() then
        return "AIR"
    elseif duck_amt > 0 or ui_get(ref.antiaim.fd) then
        return "DUCKING"
    elseif speed > 2 and not ui_get(ref.antiaim.slow_motion[2]) then
        return "RUNNING"
    elseif ui_get(ref.antiaim.slow_motion[2]) then
        return "SLOWMOTION"
    else
        return "STANDING"
    end
end

function anti_aims:aa_on_conditions()

    local handle_aa = function(pitch, yaw_base, yaw_type, yaw_ang, jitter_type, jitter_ang, body_type, body_ang, yaw_limit)
        ui_set(ref.antiaim.pitch, pitch)
        ui_set(ref.antiaim.yaw_base, yaw_base)
        ui_set(ref.antiaim.yaw[1], yaw_type)
        ui_set(ref.antiaim.yaw[2], yaw_ang)
        ui_set(ref.antiaim.jitter[1], jitter_type)
        ui_set(ref.antiaim.jitter[2], jitter_ang)
        ui_set(ref.antiaim.body_yaw[1], body_type)
        ui_set(ref.antiaim.body_yaw[2], body_ang)
        ui_set(ref.antiaim.fake_limit, yaw_limit)
    end

    if anti_aims.condition == "DUCKING" then
        handle_aa("Minimal", "At targets", "180", 0, "Center", 60, "Jitter", 180, 60)
    elseif anti_aims.condition == "AIR" then
        handle_aa("Minimal", "At targets", "180", 0, "Center", 59, "Jitter", 180, 60)
    elseif anti_aims.condition == "SLOWMOTION" then
        handle_aa("Minimal", "At targets", "180", 0, "Center", 58, "Jitter", 180, 60)
    elseif anti_aims.condition == "RUNNING" then
        handle_aa("Minimal", "At targets", "180", 0, "Center", 57, "Jitter", 180, 60)
    else 
        handle_aa("Minimal", "At targets", "180", 0, "Center", 56, "Jitter", 180, 60)
    end
end

client_set_event_callback("setup_command", function()
    anti_aims.condition = anti_aims:get_condition_type()
    helpers:handle_ground()
    anti_aims:aa_on_conditions()
end)

client_set_event_callback("paint", function()
    local scr = { client_screen_size() }
    renderer_text(scr[1] / 2, scr[2] / 2, 255, 255, 255, 255, "cb", nil, anti_aims.condition) -- simple shit for "DEBUG" 
end)
