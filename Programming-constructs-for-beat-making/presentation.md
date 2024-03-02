autoscale: true

# Programming constructs for beatmaking

---

[.build-lists: true]

# What is a beat?

- A regular repeating pulse i.e foot tap
- A pattern (or rhythm) played by drums

`-  -  -  -  -  -  -  -  -  -  -  -  -  -`


-  **Tempo ~ Speed of the pattern**


^
We have one running inside of us right now, our heartbeat. It is the basic measurement of time. When listening to music, people tap their foot in time with the beat and musicians count this measurement when performing their tracks

---

# Tempo

```rb
# 50 80 160

use_bpm 80

live_loop :amen do
  sample :loop_amen, beat_stretch: 3
  sleep 3
end
```

---

- Hip-hop: 60-100 bpm
- House: 115-130 bpm
- Techno/trance: 120-140 bpm
- Dubstep: 135-145 bpm
- Drum & bass: 160-180 bpm

^
Changing the tempo will completely change the vibe or the genre of your music
A beat can be made up of different sounds, like

---


# A Basic Beat

```ruby
use_bpm 110

live_loop :kick do
  ##| stop
  sample k
  sleep 1
end

live_loop :clap, sync: :kick do
  ##| stop
  sample c
  sleep 2
end

```

^
Thinking of beats like loops can take getting used to but a much more
intuitive way i think of is by using grids

---

# On the Grid

![inline](./static/drum1.mov)

^
backbeat because the pattern of 4 has a clap on the 2nd and 4th beat

---


# Coding the Grid

[.code-highlight: 1]
[.code-highlight: 3-5]
[.code-highlight: 6]
[.code-highlight: all]

```ruby

grid1= [ 1,0,0,0,  2,0,0,0 ]

live_loop :drum do
  8.times do |index|
    sample kick if [1, 2].include? grid1[index]
    sample clap if grid1[index] == 2
    sleep 0.25
  end
end

```

^
We can split the grid into two cause the pattern repeats


---


# Yassify the Grid

![inline](./static/beat2.mov)


---

```rb
use_bpm 100

grid1= [
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,4,0,
]

live_loop :drum do
  16.times do |index|
    sample kick, amp: 1.5 if [1, 2].include? grid1[index]
    sample clap if grid1[index] == 2
    sample hat1 if grid1[index] == 3
    sample hat2 if grid1[index] == 4
    sleep 0.25
  end
end

```

---

# 🥺 No grid
 
```rb
use_bpm 110

live_loop :kick do
  ##| stop
  sample k
  sleep 1
end

live_loop :clap, sync: :kick do
  ##| stop
  sample c
  sleep 2
end

live_loop :hat, delay: 0.5 do
  ##| stop
  sample ch, amp: 0.5
  sleep 1
end

live_loop :cymbal, sync: :kick do
  ##| stop
  sleep 2.5
  sample oh
  sleep 1.5
end

```

---

# Create new grids for Complex beats

```cpp
kick_snare= [
  1,0,0,0, 0,0,0,0,
  0,1,0,0, 2,0,0,0,
  0,0,1,0, 0,0,0,0,
  0,0,0,0, 0,0,1,0,
  0,0,0,0, 2,0,0,0,
  0,0,1,0, 0,0,0,0,
]

hihat= [
  3,0,0,3, 0,0,3,0,
  0,3,0,0, 3,3,3,0,
  0,0,3,0, 0,3,0,0,
  3,0,0,3, 0,0,3,0,
  0,3,0,0, 3,0,0,3,
  0,0,3,0, 0,3,0,0,
]

```
---

# Conditional Statements

```rb
# If <Statement> is True Do <Operation>

live_loop :kick do
  at [1, 3, 5] do
    sample kick
  end
  sleep 8
end
```


---

# Sequencing Patterns


```rb

# With conditionals we can sequence and play with patterns

define :drum_pattern do |pattern|
  v = pattern.tick(:pattern)
  if v == "x"
    return sample k
  elsif v == "o"
    return sample c, amp: 0.5
  elsif v == "-"
    return sample oh, amp: 0.5
  end
end

```

---

# Make it Bounce

```rb
use_bpm 120

live_loop :closedHiHat do # Vary the amplitude
  pattern = "4--3--3--1234--3--3--3--".ring
  
  pattern.length.times do
    sample :drum_cymbal_closed,
      amp: (pattern[look].to_f),
      sustain: 0.2 if (pattern[tick] != "-")
    
    sleep 4/pattern.length.to_f

  end
end
```

^
use integers rather than characters which in-turn control the amplitude
We can use this to add Bounciness to our beats

---

 
![center fit](https://raw.githubusercontent.com/Sangarshanan/talks/master/build-a-database/static/end.png)






