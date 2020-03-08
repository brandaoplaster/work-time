module WeekdaysHelper
    def format_seconds_to_time(total)
        mm, _ss = total.divmod(60)
        hour, minute = mm.abs.divmod(60)
        '%02d:%02d' % [hour.abs, minute.abs]
    end
end
