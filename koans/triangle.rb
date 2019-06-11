# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#





def triangle(a, b, c)
  # write this code

  arr = [a, b, c].sort

  raise TriangleError, 'the length is zero' if arr.include?(0)
  raise TriangleError, 'negative argument' if arr.min < 0

  # The uniq method removes all duplicate elements and
  # retains all unique elements in the array.
  # size method used on arrays in ruby returns number of elements in the array
  case arr.uniq.size
    when 1
      :equilateral
    when 2
      :isosceles
    else
      :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
