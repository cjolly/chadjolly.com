class Full
  def self.full
    Rails.cache.fetch("shitters_full")
  end

  def self.full!
    Rails.cache.write("shitters_full", true)
  end

  def self.reset!
    Rails.cache.write("shitters_full", false)
  end
end
