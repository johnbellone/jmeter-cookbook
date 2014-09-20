if defined?(ChefSpec)
  def run_jmeter_plan(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:jmeter_plan, :run, resource_name)
  end
end
