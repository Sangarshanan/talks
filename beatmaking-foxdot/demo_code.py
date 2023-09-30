p1 = Player("playa")

# We have Player! time to play

p1 >> prophet([0,1,2,3])

# Stop

p1.stop()

# Hook it up to a Synth

print(SynthDefs)

# Player Attributes

print(Player.get_attributes())

p1 >> prophet(
    [1,2,3], # notes
    dur=1, # duration
    oct=4, # octave
    bpm=120 # tempo
) # more params like delay, root etc

# Patterns

p1 >> prophet([0,1,2,3])

p1 >> prophet(P[0:3]) # Pattern object

print(P[:8].shuffle()) # Pattern Methods

print(P[:8].every(3, "reverse"))

p1 >> pluck(P[:4].every(1, "reverse")) # Pattern object

# reverse, swap, rotate, stretch, trim etc...

# One octave higher for even notes
p1 >> pads(P[:8].map(
    lambda x: x+7 if x % 2 == 0 else x)
)

# Them Scales

p1 >> prophet(P[:8], scale=Scale.lydian)

# All Them Scales

print(Scale.names())

# Melodies

p1 >> bass(
    [random.choice(P[0:8]) for i in range(int(8))], 
    scale=Scale.dorian, 
    dur=random.uniform(0,1)
)


p1 >> blip(
    PRand(4), # random pattern
    dur=1/4).changeSynth(list(SynthDefs))

# Time Var

var(
    [ LIST os Values ],
    [ LIST of durations]
)

print(var([0,4], 1))

a = var([0,5,1,3], [2, 1, 2, 1])
p1 >> bass(a, dur=1/2)

# Advanced Timevars

print(var([0,1]), linvar([0,1]))

# `linvar`: Changing between values at a linear rate
p1 >> pluck(P[3:5], amp=linvar([0, 1], 8), dur=1/2)

# Any parameter can be a TimeVar

p1 >> dirt(
    [0, 6, 4, 2], 
    dur=1/4, 
    hpf=linvar([0, 4000], [16, 0]), 
    pan=linvar([-1,1], 4)
)

p1.stop() # stop

# Samples

print(Samples)

d1 >> play('x ')

d1 >> play(' x o')

d1 >> play(' x-o')

d1 >> play('-x-o') # Four-on-the-floor

d2 >> play(' ~')

d2 >> play(' ~ a') # JUJU happens when you start layering beats

# (): play as if they were one character themself

d1 >> play("m-*")

# From m-* m-* ===> m- m* m- m*

d1 >> play("m(-*)")

# []: play them twice as fast

d1 >> play("--[---]") # i am speed

d2 >> play('x', dur=[1.5, 2.5, 1.5, 2.25, 0.25]) # Make it Trap Music

d1.stop()
d2.stop()

# <> play multiple sequences together using one string

d1 >> play('V:')

d2 >> play('  * ')

d1 >> play('<V:><  * >')

d1 >> play("<V:><  * ><[--]>") # JUJU

d1.stop()
d2.stop()

m2.stop()

b1.stop()
m1.stop()

# Cover

bpm = 120

d1 >> play('x o x o ', dur=0.5)

d1 >> play('x-o-x-o-', dur=0.5)

d1 >> play("x-o{-[-(-o)]}", sample=0)

bass_notes =  [0,3,1.5,1]
b1 >> bass(bass_notes, dur=2, amp=1)

mel_notes = [
    0, 1.5, 4, 4.5, 7, 4.5, 4,
    4.5, 4, 4.5, 4, 3, 4, -1
    ]
mel_dur = [ 
  0.5, 0.5, 0.5, 0.5, 1.5, 0.5, 1.5,
  0.5, 0.1, 0.1, 0.3, 0.5, 0.5, 0.5    
    ]
m1 >> orient(mel_notes, dur=mel_dur, bpm=bpm, amp=0.8)

m2 >> sinepad(
    [8, 7, 4, 3, 1.5, 1, 0], 
    dur=[i*2 for i in [0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5]],
    bpm=bpm, oct=5.5, room=0.5, mix=0.2
)

