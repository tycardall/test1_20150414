# exe_8_1

# Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immed = family.select { |k,v| k == :sisters || k == :brothers}
p immed.values.flatten