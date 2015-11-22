class UpdateInterval < ActiveRecord::Migration
  def change
    interval = Interval.find_by(hours: 72)
    interval.hours = -1
    interval.name = "Nooit"
    interval.save
  end
end
