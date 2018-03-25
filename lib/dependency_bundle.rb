class DependencyBundle
  def self.create(other = nil, &block)
    unless other.nil? || other.is_a?(DependencyBundle)
      raise TypeError, "DependencyBundle.create called with type #{other.class}, expected DependencyBundle."
    end

    new.tap do |bundle|
      other.contents.each { |name, value| bundle.inject!(name, value) } if other

      bundle.instance_exec(&block) if block
    end
  end

  def inject!(name, value)
    contents[name] = value

    define_singleton_method(name) do
      contents[name]
    end

    self
  end

  def inject(name, value)
    DependencyBundle.create(self).inject!(name, value)
  end

  def contents
    @contents ||= {}
  end
end
