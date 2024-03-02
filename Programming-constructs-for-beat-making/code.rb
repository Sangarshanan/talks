# 50 80 160

use_bpm 50

live_loop :amen do
  sample :loop_amen, beat_stretch: 3
  sleep 3
end

---------------------------------------------------------


use_bpm 110

k = "~/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
c = "~/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"


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

---------------------------------------------------------

use_bpm 100

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
clap = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"

grid1= [
  1,0,0,0, 2,0,0,0,
  1,0,0,0, 2,0,0,0,
]

live_loop :drum do
  16.times do |index|
    sample kick if [1, 2].include? grid1[index]
    sample clap if grid1[index] == 2
    sleep 0.25
  end
end

---------------------------------------------------------

use_bpm 100

kick = "~/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
clap = "~/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
hat1 = "~/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"
hat2 = "~/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats18.wav"

grid1= [
  1,0,3,0, 2,0,3,0,
  1,0,3,0, 2,0,4,0,
]


live_loop :drum do
  16.times do |index|
    puts index, grid1[index]
    sample kick, amp: 1.5 if [1, 2].include? grid1[index]
    sample clap if grid1[index] == 2
    sample hat1 if grid1[index] == 3
    sample hat2 if grid1[index] == 4
    sleep 0.25
  end
end

---------------------------------------------------------

use_bpm 110

k = "~/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
c = "~/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
ch = "~/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"
oh = "~/Downloads/samples/808_drum_kit/hihats/808-OpenHiHats18.wav"

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

---------------------------------------------------------

use_bpm 140

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks08.wav"
snare = "/Users/sangarshanan/Downloads/samples/808_drum_kit/snares/808-Snare10.wav"
hat1 = "/Users/sangarshanan/Downloads/samples/808_drum_kit/hihats/808-HiHats09.wav"

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

live_loop :drum do
  48.times do |index|
    sample :bd_haus, cutoff: 70, amp: 1.5 if kick_snare[index] == 1
    sample snare if kick_snare[index] == 2
    sample hat1 if hihat[index] == 3
    sleep 0.2
  end
end


---------------------------------------------------------

use_bpm 120

k = "~/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
c = "~/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
ch = "~/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"

live_loop :kick do
  at [1, 3, 5, 7] do
    sample k
  end
  sleep 8
end

live_loop :clap do
  at [2, 4, 6, 8] do
    sample c
  end
  sleep 8
end

---------------------------------------------------------


use_bpm 120

k = "~/Downloads/samples/808_drum_kit/kicks/808-Kicks05.wav"
c = "~/Downloads/samples/808_drum_kit/snares/808-Clap05.wav"
ch = "~/Downloads/samples/808_drum_kit/hihats/808-HiHats05.wav"

define :drum_pattern do |pattern|
  v = pattern.tick(:pattern)
  puts v
  if v == "x"
    return sample k
  elsif v == "o"
    return sample c, amp: 0.5
  elsif v == "-"
    return sample ch, amp: 0.5
  end
end

live_loop :beat do
  ##| stop
  6.times do
    drum_pattern "x-o-"
    sleep 0.5
  end
end

live_loop :beat2, sync: :beat do
  stop
  6.times do
    drum_pattern "-"
    sleep 2
  end
end


-----------------------------------

use_bpm 120

live_loop :closedHiHat do
  pattern = "4--3--3--1234--3--3--3--".ring
  
  pattern.length.times do
    sample :drum_cymbal_closed,
      amp: (pattern[look].to_f / 2),
      sustain: 0.2 if (pattern[tick] != "-")
    
    sleep 4/pattern.length.to_f
    
  end
end

live_loop :kick, sync: :closedHiHat do
  stop
  sample :bd_haus, amp: 2
  sleep 1
end

-----------------------------------

use_bpm 120

def hat(v)
  sample :hat_bdu
end

live_loop :hats do
  ##| stop
  a = [0,0,0,1,1,2,2,2,2].choose
  case a
  when 0
    8.times do
      hat(1)
      sleep 0.5
    end
  when 1
    8.times do
      hat(1)
      sleep 0.25
    end
  when 2
    2.times do
      hat(1)
      sleep 0.3
      hat(1)
      sleep 0.3
      hat(1)
      sleep 0.4
    end
  end
end

##################

kick = "/Users/sangarshanan/Downloads/samples/808_drum_kit/kicks/808-Kicks02.wav"
swing_time = 0.1

define :play_kick do
  sample :elec_hollow_kick, amp: 2
  play :A1, amp: rrand(0.5, 0.6)
end

define :play_charles do
  sample :drum_cymbal_pedal, attack:0.02, amp:rrand(0.5, 0.6), rate:1.1
end

live_loop :drums do
  stop
  
  with_fx :reverb, amp: 2 do
    [1, 0, 0, 0, 1, 0, 0, 0].each.with_index(1) do |kick, index|
      play_kick if kick == 1 and one_in(3)
      
      if index == 5
        play_charles
      end
      
      if [1,3,4,5,7,8].include? index
        sample :hat_bdu, amp: ((index == 3 or index == 7) ? rrand(0.8, 0.9)*1.5 : rrand(0.5, 0.6) )
      end
      
      if index == 5
        if one_in(4)
          sample :drum_snare_hard, amp: rrand(0.5, 0.6)*0.8, pan: 0.4
        end
      end
      
      if (index % 2) == 0
        sample :drum_snare_soft, amp: rrand(0.5, 0.6) if rand < 0.05
      end
      
      
      if(index % 2) == 0
        sleep (0.25 - swing_time)
      else
        sleep (0.25 + swing_time)
      end
    end
  end
end



