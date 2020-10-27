

local wl = {}

for i = 1, 15 do
  wl[i] = {}
  wl[i].img = true
  wl[i].chars = {}
  wl[i].word = ""
end


wl[1].word = "star"
wl[2].word = "part"
wl[3].word = "shark"
wl[4].word = "care"
wl[5].word = "stare"
wl[6].word = "rare"
wl[7].word = "dare"
wl[8].word = "flair"
wl[9].word = "hair"
wl[10].word = "pair"
wl[11].word = "chair"
wl[12].word = "fair"
wl[13].word = "believe"
wl[14].word = "material"
wl[15].word = "built"

for i = 1, #wl do
  for j = 1, #wl[i].word do
    local c = wl[i].word:sub(j,j)
    table.insert(wl[i].chars, c)
  end
end

return wl