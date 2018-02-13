require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrayAssignment < Neo::Koan
  def test_non_parallel_assignment
    # Use %w or %W for an array of words.
    # names = ["John", "Smith"]
    # Do not use parallel assignment.
    # names = %w[John Smith]
    names[0] = %w[John]
    names[1] = %w[Smith]
    assert_equal %w[John], names[0]
    assert_equal %w[Smith], names[1]
  end

  def test_parallel_assignments
    # Do not use parallel assignment. first_name, last_name = %w[John Smith]
    # first_name, last_name = %w[John Smith]
    first_name = %w[John]
    last_name = %w[Smith]
    assert_equal 'John', first_name
    assert_equal 'Smith', last_name
  end

  def test_parallel_assignments_with_extra_values
    first_name, last_name = %w[John Smith III]
    assert_equal 'John', first_name
    assert_equal 'Smith', last_name
  end

  def test_parallel_assignments_with_splat_operator
    first_name, *last_name = %w[John Smith III]
    assert_equal 'John', first_name
    assert_equal %w[John III], last_name
  end

  def test_parallel_assignments_with_too_few_variables
    first_name, last_name = %w[Cher]
    assert_equal 'Cher', first_name
    assert_equal nil, last_name
  end

  def test_parallel_assignments_with_subarrays
    first_name, last_name = %w[[Willie Rae] Johnson]
    assert_equal %w[Willie Rae], first_name
    assert_equal 'Johnson', last_name
  end

  def test_parallel_assignment_with_one_variable
    first_name, = %w[John Smith]
    assert_equal 'John', first_name
  end

  def test_swapping_with_parallel_assignment
    first_name = 'Roy'
    last_name = 'Rob'
    first_name, last_name = last_name, first_name
    assert_equal 'Rob', first_name
    assert_equal 'Roy', last_name
  end
end
