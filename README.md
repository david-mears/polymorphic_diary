I wanted to check if this was best practice for polymorphism.

Question for feedback: is this good OOP? What could be done better?

I did exercise 4 here:

https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/oo_relationships.md#exercise-4

Scrambling by reversing chars requires one less argument than scrambling by advancing chars, which uses `steps` to know how far through the alphabet to advance the letters. But to make the interfaces the same, I had both types of scrambling take the same arguments. Since I didn't want anyone to need to define the number of steps when it was irrelevant (i.e. when using reversing), I made the parameter optional with a default to 0:

```ruby
diary = ScrambleDiary.new
diary.scramble(scramble_type=ReversingChars) # No steps argument
```

That forced me to protect AdvancingChars from people accidentally calling `diary.scramble(scramble_type=AdvancingChars)` without `steps` such that steps defaults to 0, which would result in a scramble with no effect. So I added a validation step in there, which fails out of the insecure scramble by raising an error.

It occurs to me that perhaps this is bad practice because I had to add a validation step, which could later break or simply be bad for performanth.
