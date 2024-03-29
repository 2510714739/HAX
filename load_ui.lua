version = '1.55'
updatetime = '2023/04/15'
local notify = (function()
    local notify = {callback_registered = false, maximum_count = 7, data = {}, svg_texture = [[<svg id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><g><g><path d="m216.188 82.318h48.768v37.149h-48.768z" fill="#ffcbbe"/></g><g><path d="m250.992 82.318h13.964v37.149h-13.964z" fill="#fdad9d"/></g><g><ellipse cx="240.572" cy="47.717" fill="#ffcbbe" rx="41.682" ry="49.166" transform="matrix(.89 -.456 .456 .89 4.732 115.032)"/></g><g><path d="m277.661 28.697c-10.828-21.115-32.546-32.231-51.522-27.689 10.933 4.421 20.864 13.29 27.138 25.524 12.39 24.162 5.829 52.265-14.654 62.769-2.583 1.325-5.264 2.304-8.003 2.96 10.661 4.31 22.274 4.391 32.387-.795 20.483-10.504 27.044-38.607 14.654-62.769z" fill="#fdad9d"/></g><g><path d="m296.072 296.122h-111.001v-144.174c0-22.184 17.984-40.168 40.168-40.168h30.666c22.184 0 40.168 17.984 40.168 40.168v144.174z" fill="#95d6a4"/></g><g><path d="m256.097 111.78h-24.384c22.077 0 39.975 17.897 39.975 39.975v144.367h24.384v-144.367c0-22.077-17.897-39.975-39.975-39.975z" fill="#78c2a4"/></g><g><path d="m225.476 41.375c0-8.811 7.143-15.954 15.954-15.954h34.401c-13.036-21.859-38.163-31.469-57.694-21.453-19.846 10.177-26.623 36.875-15.756 60.503 12.755-.001 23.095-10.341 23.095-23.096z" fill="#756e78"/></g><g><path d="m252.677 25.421h23.155c-11.31-18.964-31.718-28.699-49.679-24.408 10.591 4.287 20.23 12.757 26.524 24.408z" fill="#665e66"/></g><g><path d="m444.759 453.15-28.194-9.144c-3.04-.986-5.099-3.818-5.099-7.014v-4.69l-2.986-8.22h-61.669l-2.986 8.22v34.22c0 8.628 6.994 15.622 15.622 15.622h81.993c5.94 0 10.755-4.815 10.755-10.755v-8.008c.001-4.662-3.002-8.793-7.436-10.231z" fill="#aa7a63"/></g><g><path d="m444.759 453.15-28.194-9.144c-3.04-.986-5.099-3.818-5.099-7.014v-4.69l-2.986-8.22h-25.91v12.911c0 3.196 2.059 6.028 5.099 7.014l28.194 9.144c4.434 1.438 7.437 5.569 7.437 10.23v8.008c0 5.94-4.815 10.755-10.755 10.755h28.896c5.94 0 10.755-4.815 10.755-10.755v-8.008c0-4.662-3.003-8.793-7.437-10.231z" fill="#986b54"/></g><g><path d="m343.827 344.798v87.505h67.64v-123.053c0-20.65-16.74-37.39-37.39-37.39h-189.006v33.212c0 19.014 15.414 34.428 34.428 34.428h119.03c2.926 0 5.298 2.372 5.298 5.298z" fill="#5766cb"/></g><g><path d="m382.571 309.25v123.052h28.896v-123.052c0-20.65-16.74-37.39-37.39-37.39h-28.896c20.65 0 37.39 16.74 37.39 37.39z" fill="#3d4fc3"/></g><g><g><path d="m437.268 512h-108.548c-8.244 0-14.928-6.684-14.928-14.928v-107.221c0-11.247-9.15-20.399-20.398-20.399h-123.543c-8.244 0-14.928-6.684-14.928-14.928v-150.17h-22.748c-8.244 0-14.928-6.684-14.928-14.928s6.684-14.928 14.928-14.928h37.676c8.244 0 14.928 6.684 14.928 14.928v150.17h108.616c27.71 0 50.254 22.545 50.254 50.255v92.293h93.619c8.244 0 14.928 6.684 14.928 14.928s-6.684 14.928-14.928 14.928z" fill="#756e78"/></g></g><g><g><path d="m437.268 482.144h-15.115c8.244 0 14.928 6.684 14.928 14.928s-6.683 14.928-14.928 14.928h15.115c8.244 0 14.928-6.684 14.928-14.928s-6.684-14.928-14.928-14.928z" fill="#665e66"/></g><g><path d="m328.534 389.851v83.296c0 4.969 4.028 8.997 8.997 8.997h6.118v-92.293c0-27.755-22.5-50.255-50.255-50.255h-15.114c27.71 0 50.254 22.545 50.254 50.255z" fill="#665e66"/></g><g><path d="m169.664 189.426v150.17h15.115v-150.17c0-8.244-6.684-14.928-14.928-14.928h-15.115c8.245 0 14.928 6.684 14.928 14.928z" fill="#665e66"/></g></g><g><g><path d="m171.702 511.498c-61.701 0-111.898-50.197-111.898-111.898s50.197-111.898 111.898-111.898 111.898 50.197 111.898 111.898-50.197 111.898-111.898 111.898zm0-193.94c-45.238 0-82.042 36.804-82.042 82.042s36.804 82.042 82.042 82.042 82.042-36.804 82.042-82.042-36.804-82.042-82.042-82.042z" fill="#756e78"/></g></g><g><g><path d="m243.485 313.833c16.3 19.444 26.131 44.485 26.131 71.783 0 61.701-50.197 111.898-111.898 111.898-27.298 0-52.339-9.831-71.783-26.131 20.543 24.504 51.364 40.115 85.767 40.115 61.701 0 111.898-50.197 111.898-111.898 0-34.403-15.61-65.225-40.115-85.767z" fill="#665e66"/></g></g><g><path d="m384.583 259.81 13.927 12.767c8.319 7.626 13.447 18.117 14.353 29.366l.509 6.316c.283 3.513-3.591 5.82-6.545 3.898l-45.845-29.834z" fill="#ffcbbe"/></g><g><path d="m413.372 308.259-.509-6.316c-.906-11.249-6.034-21.74-14.353-29.366l-13.927-12.767-7.744 7.387 5.869 5.38c8.319 7.626 13.447 18.117 14.353 29.366l.328 4.072 9.438 6.142c2.954 1.921 6.828-.386 6.545-3.898z" fill="#fdad9d"/></g><g><g><path d="m366.869 290.965c-1.448 1.448-3.783 1.589-5.341.26-8.038-6.857-18.146-10.594-28.827-10.594h-69.416c-31.072 0-56.26-25.188-56.26-56.26v-63.312c0-12.367 10.025-22.392 22.392-22.392 12.367 0 22.392 10.025 22.392 22.392v63.312c0 6.338 5.138 11.476 11.476 11.476h69.415c22.462 0 43.657 8.238 60.136 23.284 1.672 1.526 1.716 4.151.115 5.752z" fill="#95d6a4"/></g></g><g><path d="m392.836 259.13c-16.479-15.047-37.674-23.284-60.136-23.284h-69.416c-6.338 0-11.476-5.138-11.476-11.476v-63.312c0-12.367-10.025-22.392-22.392-22.392-3.429 0-6.676.773-9.581 2.151 5.315 4.094 8.743 10.518 8.743 17.746v74.508c0 6.338 5.138 11.476 11.476 11.476h69.416c22.462 0 43.657 8.238 60.136 23.284 1.672 1.526 1.716 4.151.115 5.752l-13.663 13.663c1.907 1.181 3.739 2.503 5.469 3.979 1.558 1.329 3.893 1.188 5.341-.26l26.082-26.082c1.602-1.602 1.558-4.226-.114-5.753z" fill="#78c2a4"/></g></g></svg>
]]}
    local svg_size = { w = 20, h = 20}
    local svg = renderer.load_svg(notify.svg_texture, svg_size.w, svg_size.h)
    function notify:register_callback()
        if self.callback_registered then return end
        client.set_event_callback('paint_ui', function()
            local screen = {client.screen_size()}
            local color = {15, 15, 15}
            local d = 5;
            local data = self.data;
            for f = #data, 1, -1 do
                data[f].time = data[f].time - globals.frametime()
                local alpha, h = 255, 0;
                local _data = data[f]
                if _data.time < 0 then
                    table.remove(data, f)
                else
                    local time_diff = _data.def_time - _data.time;
                    local time_diff = time_diff > 1 and 1 or time_diff;
                    if _data.time < 0.5 or time_diff < 0.5 then
                        h = (time_diff < 1 and time_diff or _data.time) / 0.5;
                        alpha = h * 255;
                        if h < 0.2 then
                            d = d + 15 * (1.0 - h / 0.2)
                        end
                    end
                    local text_data = {renderer.measure_text("dc", _data.draw)}
                    local screen_data = {
                        screen[1] / 2 - text_data[1] / 2 + 3, screen[2] - screen[2] / 100 * 17.4 + d
                    }
                    renderer.rectangle(screen_data[1] - 30, screen_data[2] - 22, text_data[1] + 60, 2, 83, 126, 242, alpha)
                    renderer.rectangle(screen_data[1] - 29, screen_data[2] - 20, text_data[1] + 58, 29, color[1], color[2],color[3], alpha <= 135 and alpha or 135)
                    renderer.line(screen_data[1] - 30, screen_data[2] - 22, screen_data[1] - 30, screen_data[2] - 20 + 30, 83, 126, 242, alpha <= 50 and alpha or 50)
                    renderer.line(screen_data[1] - 30 + text_data[1] + 60, screen_data[2] - 22, screen_data[1] - 30 + text_data[1] + 60, screen_data[2] - 20 + 30, 83, 126, 242, alpha <= 50 and alpha or 50)
                    renderer.line(screen_data[1] - 30, screen_data[2] - 20 + 30, screen_data[1] - 30 + text_data[1] + 60, screen_data[2] - 20 + 30, 83, 126, 242, alpha <= 50 and alpha or 50)
                    renderer.text(screen_data[1] + text_data[1] / 2 + 10, screen_data[2] - 5, 255, 255, 255, alpha, 'dc', nil, _data.draw)
                    renderer.texture(svg, screen_data[1] - svg_size.w/2 - 5, screen_data[2] - svg_size.h/2 - 5, svg_size.w, svg_size.h, 255, 255, 255, alpha)
                    d = d - 50
                end
            end
            self.callback_registered = true
        end)
    end
    function notify:paint(time, text)
        local timer = tonumber(time) + 1;
        for f = self.maximum_count, 2, -1 do
            self.data[f] = self.data[f - 1]
        end
        self.data[1] = {time = timer, def_time = timer, draw = text}
        self:register_callback()
    end
    return notify
end)()
notify:paint(10, "[+] Lua Update: " .. updatetime)
notify:paint(20, "[+] Bug&Suggestion PM COGx3#8752")
