class PostPoroDecorator
  delegate_missing_to :post

  def initialize(post)
    @post = post
  end

  def self.decorate(record, *_)
    if record.is_a?(Enumerable)
      record.map { |individual_record| new(individual_record) }
    else
      new(record)
    end
  end

  def decorator_method
    'A method only available on the PORO decorator'
  end

  private

  attr_reader :post
end
