# Tardis::Time is the module where all time based methods, classes, and modules
# are defined. Anything that has to do with the second unit of measurement goes
# into Tardis::Time.
module Tardis::Time
    # Defining the basic units of time, with the base being 1 second
    Second  = 1
    Minute  = Second  * 60
    Hour    = Minute  * 60
    Day     = Hour    * 24
    Week    = Day     * 7
    Month   = Week    * 4
    Year    = Month   * 12
    Decade  = Year    * 10
    Century = Decade  * 10
end

require_relative 'time/math'
require_relative 'time/travel'
require_relative 'time/conversion'

# To allow for syntax like 5.seconds I need to include the Time modules
# into Integer. This is commonly considered "monkey patching" and to some a
# bad idea. I think that while some "monkey patching" is bad it's much like
# programming in that there are good and bad patches.
#
# In this case I have decided that since the patched methods and classes
# are pretty unique there won't be any problems.
class Integer

  # Including all of the math methods, like 5.centuries
  include Tardis::Time::Math

  # Including in all of the conversion methods, like 5.hours.to_minutes
  include Tardis::Time::Conversion

  # Including all of the Travel methods
  include Tardis::Time::Travel
end

# Similar to the above comment about "monkey patching" on Integer
# I've included Tardis into Time as well.
class Time

  # Including all the point of time traveling, like 5.days.later
  include Tardis::Time::Travel
end
