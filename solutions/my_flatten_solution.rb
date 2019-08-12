class Array
  def my_flatten
    flattened = []
    self.each do |el|
      el.is_a?(Array) ? flattened += el.my_flatten : flattened << el
    end
    flattened
  end

  def my_controlled_flatten(level = nil)
    flattened = []

    self.each do |ele|
      if ele.is_a?(Array) && level != 0
        flattened += (level.nil? ? ele.my_controlled_flatten : ele.my_controlled_flatten(level - 1))
      else
        flattened << ele
      end
    end

    flattened
  end
end
