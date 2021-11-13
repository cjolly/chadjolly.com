class Full
  @@full = false

  def self.full
    @@full
  end

  def self.full!
    @@full = true
  end
end
