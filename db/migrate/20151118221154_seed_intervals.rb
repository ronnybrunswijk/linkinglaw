class SeedIntervals < ActiveRecord::Migration
  def change
    Interval.create(name: 'Meteen', hours: 0)
    Interval.create(name: '1 keer per dag', hours: 24)
    Interval.create(name: '1 keer per 3 dagen', hours: 72)    
  end
end
