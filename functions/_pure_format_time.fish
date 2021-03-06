set fail 1

function _pure_format_time \
    --description="Format milliseconds to a human readable format" \
    --argument-names milliseconds threshold
    
    if test $milliseconds -lt 0; return $fail; end

    set --local millis (math -s0 "$milliseconds % 1000")
    set --local seconds (math -s0 "$milliseconds / 1000 % 60")
    set --local minutes (math -s0 "$milliseconds / 60000 % 60")
    set --local hours (math -s0 "$milliseconds / 3600000 % 24")
    set --local days (math -s0 "$milliseconds / 86400000")
    set --local time

    if test $days -gt 0
        set time $time (printf "%sd" $days)
    end

    if test $hours -gt 0
        set time $time (printf "%sh" $hours)
    end

    if test $minutes -gt 0
        set time $time (printf "%sm" $minutes)
    end

    if test $seconds -gt 0
        set time $time (printf "%ss" $seconds)
    end

    if test $millis -gt 0
        set time $time (printf "%sms" $millis)
    end

    echo -e (string join ' ' $time)
end
