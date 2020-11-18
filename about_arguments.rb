def about_plain_arguments(x, y, z)
  x + y * z
end

def about_plain_arguments_with_defaults(x = 1, y = 4, z = 5)
  x + y * z
end

def about_keyword_arguments(x:, y:, z:)
  x + y * z
end

def about_keyword_arguments_with_defaults(x: 3, y: 4, z: 5)
  x + y * z
end

# p about_plain_arguments(1, 2, 4)
# p about_keyword_arguments(x: 4, y: 3, z: 5)
# p about_plain_arguments_with_defaults(2, 5)
# p about_keyword_arguments_with_defaults(x: 4, y: 3, z: 5)

args_array = [1, 1, 1]
args_hash = { x: 2, y: 2, z: 2 }

# p about_plain_arguments(args_hash)
p about_plain_arguments(*args_array)
p about_keyword_arguments(**args_hash)
# p about_keyword_arguments(*args_array)
