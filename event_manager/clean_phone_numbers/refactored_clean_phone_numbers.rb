def clean_phone_numbers(homephone)
  homephone.gsub!(/[()-." "]/, "")

  return homephone        if homephone.length == 10
  return homephone[1..-1] if homephone.length == 11 && homephone[0] == '1'

  'No phone'
end

contents = CSV.open(
  "../clifford/event_manager/event_attendees.csv",
  headers: true,
  header_converters: :symbol
)

contents.each do |columns|
  phone = clean_phone_numbers(columns[:homephone])
  puts "#{phone}"
end


# Refactor Redes:
# 1. Architecture
# 2. Readability/maintainability
# 3. Performance
# 4. Probleem op to los
#
# Ternary statement
