class Array
  # Define a method `Array#my_select(&prc)` that correctly returns an array of 
  # selected elements according to the block.  You CANNOT use Ruby's 
  # `Array#select`, `Array#select!`, `Array#reject`, OR `Array#reject!`.

  def my_select(&prc)
    selects = []

    self.each do |item|
      selects << item if prc.call(item)
    end

    selects
  end
end
