module EventsHelper
  def fix_http_proto(url)
    if url.start_with?('https') or url.start_with?('http') or url.start_with?('ftp')
      url
    else
      "http://#{url}"
    end
  end

  def event_start_time
    return t(:date_not_set) unless @event.start_time
    I18n.l(@event.start_time, format: :pretty_datetime)
  end

  def timeslots
    slots = []
    slots << [format_time_slots(1), 1]   # 00:15
    slots << [format_time_slots(2), 2]   # 00:30
    slots << [format_time_slots(3), 3]   # 00:45
    slots << [format_time_slots(4), 4]   # 01:00
    slots << [format_time_slots(5), 5]   # 01:15
    #(@conference.max_timeslots + 1).times do |i|
    #  slots << [format_time_slots(i), i]
    #end
    slots
  end

  def format_time_slots(number_of_time_slots)
    duration_in_minutes = number_of_time_slots * @conference.timeslot_duration
    duration_to_time(duration_in_minutes)
  end
end
