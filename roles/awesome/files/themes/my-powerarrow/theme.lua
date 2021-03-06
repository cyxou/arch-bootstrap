--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

-- For debugging
local naughty = require("naughty")
--naughty.notify { text = "some prop to debug" }

--local os = { getenv = os.getenv }
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/my-powerarrow"
theme.wallpaper                                 = theme.dir .. "/wall.jpeg"
theme.font                                      = "Ubuntu Mono 12"
theme.fg_normal                                 = "#DDDDFF"
theme.fg_normal_inv                             = "#1B2B34"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#313131"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = "#313131"
theme.border_width                              = 1
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = "#1A1A1A"
theme.arrow_col1                                = "#3F3E3F"
theme.arrow_col2                                = "#6A66A3"
theme.arrow_col3                                = "#50808E"
theme.arrow_col4                                = "#535253"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 16
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_termfair                           = theme.dir .. "/icons/termfair.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery_full                       = theme.dir .. "/icons/baseline-battery_full-24px_white.svg"
theme.widget_battery_20                         = theme.dir .. "/icons/baseline-battery_20-24px_white.svg"
theme.widget_battery_30                         = theme.dir .. "/icons/baseline-battery_30-24px_white.svg"
theme.widget_battery_50                         = theme.dir .. "/icons/baseline-battery_50-24px_white.svg"
theme.widget_battery_60                         = theme.dir .. "/icons/baseline-battery_60-24px_white.svg"
theme.widget_battery_80                         = theme.dir .. "/icons/baseline-battery_80-24px_white.svg"
theme.widget_battery_90                         = theme.dir .. "/icons/baseline-battery_90-24px_white.svg"
theme.widget_battery_alert                      = theme.dir .. "/icons/baseline-battery_alert-24px_white.svg"
theme.widget_battery_charging                   = theme.dir .. "/icons/baseline-battery_charging_full-24px_white.svg"
theme.widget_mem                                = theme.dir .. "/icons/baseline-memory-24px.svg"
theme.widget_cpu                                = theme.dir .. "/icons/microchip-solid.svg"
theme.widget_temp                               = theme.dir .. "/icons/thermometer-solid.svg"
theme.widget_net                                = theme.dir .. "/icons/baseline-wifi-24px.svg"
theme.widget_net_off                            = theme.dir .. "/icons/baseline-wifi_off-24px.svg"
theme.widget_hdd                                = theme.dir .. "/icons/hdd-regular.svg"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/baseline-email-24px.svg"
theme.widget_mail_on                            = theme.dir .. "/icons/baseline-email-on-24px.svg"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 0
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
theme.cal = lain.widget.calendar({
    attach_to = { clock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Mail IMAP check
--local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
local mail = lain.widget.imap({
    is_plain = false,
    timeout  = 300, -- 5 minutes
    server   = "imappro.zoho.com",
    mail     = "admin@getbot.ru",
    password = "cat /home/alex/.zoho_mail_pwd",
    --notify   = "off",
    --password = function()
        --password = "cat /home/alex/.zoho_mail_pwd",
        --ret = os.execute("cat /home/alex/.zoho_mail_pwd")
        --naughty.notify({ title = 'ALOHA', text = ret })
        --return ret
    --end,
    settings = function()
        mail_notification_preset = {
          icon = theme.widget_mail,
          position = "top_left"
        }
        if mailcount > 0 then
            widget:set_text(" " .. mailcount .. " ")
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]

-- MPD
--[[
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        awful.spawn.with_shell("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        awful.spawn.with_shell("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        awful.spawn.with_shell("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
    end
})
--]]

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
-- To get the proper tempfile, you need to do:
-- grep "" /sys/devices/platform/coretemp.?/hwmon/hwmon?/temp?_label
-- The path in which the 'Package id 0' is found will be the hint to the .../tempX_input file
local temp = lain.widget.temp({
    tempfile = "/sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input",
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.font },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})

-- Battery
-- Set battery percentage color to red if charge is low.
local batArrowColor
function setBatArrowColor(batPerc)
  if tonumber(batPerc) <= 100 and tonumber(batPerc) > 75 then
    batArrowColor = "#99C794"
  elseif tonumber(batPerc) <= 75 and tonumber(batPerc) > 50 then
    batArrowColor = "#6CB25B"
  elseif tonumber(batPerc) <= 50 and tonumber(batPerc) > 25 then
    batArrowColor = "#FFC857"
  elseif tonumber(batPerc) <= 25 and tonumber(batPerc) > 10 then
    batArrowColor = "#FE9920"
  elseif tonumber(batPerc) <= 10 then
    batArrowColor = "#EC5f67"
  else
    batArrowColor = "#4B696D"
  end
end
function getBatArrowColor()
  return batArrowColor
end
local baticon = wibox.widget.imagebox(theme.widget_battery_full)
local bat = lain.widget.bat({
    ac = "AC",
    battery = "BAT0",
    n_perc = { 5, 10 },
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            setBatArrowColor(bat_now.perc)
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC " .. bat_now.perc .. "% "))
                baticon:set_image(theme.widget_battery_charging)
                return
            elseif bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_alert)
            elseif bat_now.perc and tonumber(bat_now.perc) <= 20 then
                baticon:set_image(theme.widget_battery_20)
            elseif bat_now.perc and tonumber(bat_now.perc) <= 30 then
                baticon:set_image(theme.widget_battery_30)
            elseif bat_now.perc and tonumber(bat_now.perc) <= 50 then
                baticon:set_image(theme.widget_battery_50)
            elseif bat_now.perc and tonumber(bat_now.perc) <= 60 then
                baticon:set_image(theme.widget_battery_60)
            elseif bat_now.perc and tonumber(bat_now.perc) <= 80 then
                baticon:set_image(theme.widget_battery_80)
            elseif bat_now.perc and tonumber(bat_now.perc) <= 90 then
                baticon:set_image(theme.widget_battery_90)
            else
                baticon:set_image(theme.widget_battery_full)
            end
            --widget:set_markup(markup(theme.fg_normal_inv, markup.font(theme.font, " " .. bat_now.perc .. "% ")))
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_battery_charging)
        end
    end
})

-- ALSA volume bar
theme.volume = lain.widget.alsabar({
    ticks = true, width = 67,
    notification_preset = { font = theme.font }
})
theme.volume.tooltip.wibox.fg = theme.fg_focus
theme.volume.tooltip.wibox.font = theme.font
theme.volume.bar:buttons(my_table.join (
          awful.button({}, 1, function()
            awful.spawn.with_shell(string.format("%s -e alsamixer", terminal))
          end),
          awful.button({}, 2, function()
            awful.spawn(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 3, function()
            awful.spawn(string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 4, function()
            awful.spawn(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end),
          awful.button({}, 5, function()
            awful.spawn(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
            theme.volume.update()
          end)
))
local volumebg = wibox.container.background(theme.volume.bar, "#585858", gears.shape.rectangle)
local volumewidget = wibox.container.margin(volumebg, 7, 7, 5, 5)

-- Keyboard map indicator and changer (make it global in order to be used from
-- rc.lua)
kbdcfg = {
  cmd = "setxkbmap",
  layout = { { "us", "" , "<b>EN</b>" }, { "ru", "" , "<b>RU</b>" } },
  current = 1, -- us is our default layout
  widget = wibox.widget.textbox(),
  switch = function ()
    kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
      local t = kbdcfg.layout[kbdcfg.current]
      kbdcfg.widget:set_markup(markup(theme.fg_normal, markup.font(theme.font, " " .. t[3] .. " ")))
      os.execute(kbdcfg.cmd .. " " .. t[1] .. " " .. t[2])
  end,
  switchToUs = function ()
    kbdcfg.current = 1
      local t = kbdcfg.layout[kbdcfg.current]
      kbdcfg.widget:set_markup(markup(theme.fg_normal, markup.font(theme.font, " " .. t[3] .. " ")))
      os.execute(kbdcfg.cmd .. " " .. t[1] .. " " .. t[2])
  end
}

kbdcfg.widget:set_markup(markup(theme.fg_normal, " " .. markup.font(theme.font, kbdcfg.layout[kbdcfg.current][3] .. " ")))
-- Mouse bindings
kbdcfg.widget:buttons(
  awful.util.table.join(awful.button({ }, 1, function () kbdcfg.switch() end))
)


-- Net
local neticon = wibox.widget.imagebox(theme.widget_net_off)
local net = lain.widget.net({
    iface = "wlp59s0",
    settings = function()
        if net_now.state == "up" then
            neticon:set_image(theme.widget_net)
            widget:set_markup(markup.font(theme.font,
                              markup("#7AC82E", " " .. net_now.received)
                              .. " " ..
                              markup("#46A8C3", " " .. net_now.sent .. " ")))
        else
            neticon:set_image(theme.widget_net_off)
            widget:set_markup(markup.font(theme.font, " Off"))
        end
    end
})

-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(theme.bg_normal, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_normal)
local arrow   = separators.arrow_left
local arrow_r = separators.arrow_right

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal, argname = "--name %s" })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    -- Set default tile layout to every tag
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt({
        bg = theme.arrow_col1
    })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s,
      awful.widget.taglist.filter.all,
      awful.util.taglist_buttons, {
        bg_focus = theme.arrow_col4
      })

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s,
      awful.widget.tasklist.filter.currenttags,
      awful.util.tasklist_buttons, {
        bg_normal = theme.bg_normal,
        bg_focus = theme.bg_focus
      })

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 18, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            --s.mytaglist,
            --s.mypromptbox,
            arrow_r(theme.bg_focus, theme.arrow_col4),
            wibox.container.background(wibox.container.margin(wibox.widget { s.mytaglist, layout = wibox.layout.align.horizontal }, 3, 3), theme.arrow_col4),
            arrow_r(theme.arrow_col4, theme.arrow_col1),
            wibox.container.background(wibox.container.margin(wibox.widget { s.mypromptbox, layout = wibox.layout.align.horizontal }, 3, 3), theme.arrow_col1),
            arrow_r(theme.arrow_col1, theme.bg_focus),
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            spr,
            arrl_ld,
            arrl_dl,
            arrl_ld,
            arrl_dl,
            neticon,
            net.widget,
            arrl_ld,
            wibox.container.background(volumewidget, theme.bg_focus),
            --wibox.container.background(mailicon, theme.bg_focus),
            --wibox.container.background(mail.widget, theme.bg_focus),
            arrl_dl,
            memicon,
            mem.widget,
            arrl_ld,
            wibox.container.background(cpuicon, theme.bg_focus),
            wibox.container.background(cpu.widget, theme.bg_focus),
            arrl_dl,
            tempicon,
            temp.widget,
            arrl_ld,
            wibox.container.background(fsicon, theme.bg_focus),
            wibox.container.background(theme.fs.widget, theme.bg_focus),
            arrow(theme.bg_focus, theme.arrow_col3),
            wibox.container.background(wibox.container.margin(wibox.widget { baticon, bat.widget, layout = wibox.layout.align.horizontal }, 3, 3), theme.arrow_col3),
            arrow(theme.arrow_col3, theme.arrow_col2),
            wibox.container.background(wibox.container.margin(wibox.widget { kbdcfg.widget, layout = wibox.layout.align.horizontal }, 3, 3), theme.arrow_col2),
            arrow(theme.arrow_col2, theme.arrow_col4),
            wibox.container.background(wibox.container.margin(wibox.widget { clock, layout = wibox.layout.align.horizontal }, 3, 3), theme.arrow_col4),
            arrow(theme.arrow_col4, theme.bg_normal),
            wibox.container.background(s.mylayoutbox, theme.bg_focus),
        },
    }
end

return theme
