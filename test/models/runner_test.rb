require 'test_helper'

class RunnerTest < ActiveSupport::TestCase

  test "valid with all fields" do
  	r = runners(:one)
  	assert r.valid?, "Runner was not valid"
  end

  test "runner_invalid_without_name" do
  	r = runners(:two)
  	r.name = nil
  	assert !r.valid?, "Runner without name"
  end

  test "runner is old enough" do
  	r = runners(:one)
  	assert_operator r.age, :>, 18
  end

  test "runner is too young" do
  	r = runners(:joven)
  	assert_operator r.age, :<, 18
  end
  
end
