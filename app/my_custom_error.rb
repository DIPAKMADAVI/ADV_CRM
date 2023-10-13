class MyCustomError < StandardError
  def initialize(message = "A custom error occurred")
    super(message)
  end
   end