module WithFriendlyDateTime
  def friendly_date
    self.created_at.to_date.strftime('%b %-m, %Y')
  end

  def friendly_time
    self.created_at.to_datetime.strftime('%-I:%M %p')
  end
end
