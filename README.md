I wanted to check if this was best practice for polymorphism. I followed exercise 4 here:

https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/oo_relationships.md

Scrambling by reversing chars requires one less argument than scrambling by advancing chars. But to make the interfaces the same, I had both types of scrambling take the same arguments. Since I didn't want anyone to need to define number of steps when it was irrelevant (i.e. when using reversing), I made the parameter optional with a default to 0:

```ruby
ScrambleDiary.new()scramble(scramble_type=ReversingChars)
```

That forced me to protect AdvancingChars from people accidentally calling `scramble` with the default number of steps, which would result in a scramble with no effect. So I added a validation step in there, which fails out of the insecure scramble by raising an error.

Question for feedback: is this good OOP? What could be done better?