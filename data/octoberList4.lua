local wl = {}

for i = 1, 17 do
  wl[i] = {}
  wl[i].img = true
  wl[i].chars = {}
  wl[i].word = ""
end


wl[1].word = "cold"
wl[2].word = "know"
wl[3].word = "does"
wl[4].word = "laugh"
wl[5].word = "both"
wl[6].word = "again"
wl[7].word = "car"
wl[8].word = "far"
wl[9].word = "star"
wl[10].word = "born"
wl[11].word = "corn"
wl[12].word = "fern"
wl[13].word = "stern"
wl[14].word = "bird"
wl[15].word = "third"
wl[16].word = "turn"
wl[17].word = "burn"


for i = 1, #wl do
  for j = 1, #wl[i].word do
    local c = wl[i].word:sub(j,j)
    table.insert(wl[i].chars, c)
  end
end

return wl