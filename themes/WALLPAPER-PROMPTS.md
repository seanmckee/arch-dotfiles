# Wallpaper generation prompts

One prompt per theme (11 total). Paste a whole code block into ChatGPT / any image
model — each block is self-contained, no need to prepend anything.

Every theme gets a **different medium and subject** on purpose: anime cityscape,
ukiyo-e woodblock, risograph print, low-poly vector, sumi-e ink, botanical
line-art, CRT phosphor. Switching themes should change the *feel* of the machine,
not just the hue.

## How to install the results

Save each image as **`<theme-name>.png`** (or `.jpg` / `.jpeg` / `.webp`) into
`~/Pictures/wallpapers/`, using the exact theme name as the filename:

```
~/Pictures/wallpapers/catppuccin-mocha.png
~/Pictures/wallpapers/kanagawa.jpg
```

`theme` prefers a real image at that path and only falls back to the palette's
generated gradient if none exists (see `bin/.local/bin/theme`, wallpaper block).
**No config editing needed** — drop the file in and run `theme set <name>`
(or SUPER+SHIFT+T).

## Display + resolution

The target display is **2240x1400 (16:10)**, so every prompt asks for 16:10 —
a 16:9 image would get cropped top and bottom, eating the quiet strip the
status bar needs. gpt-image-2 handles 3:1 through 1:3, so 16:10 is native;
2K is stable and 4K is in beta. 2048x1280 upscales to the panel at 1.09x,
which is invisible on this kind of dark low-contrast art.

## The shared rules (already baked into every prompt below)

- **No gradients.** No radial glow blobs, no soft airbrushed sky washes, no
  "abstract fluid" backgrounds. Colour comes from flat fills, hard shapes, line
  work, and texture.
- Very dark overall, low contrast — it sits behind translucent waybar + kitty.
- Top ~8% quiet (status bar), centre calm (windows). Interest in the lower third
  and along the edges.
- No text, letters, logos, watermarks, UI mockups.
- Landscape 16:10, 2048x1280 or larger.

---

## tokyo-night — *Tokyo Night Storm*

**Feel:** anime night city. Coding at 2am with the city asleep below.

```text
An anime-style night cityscape desktop wallpaper, in the style of a Makoto Shinkai / Studio background painting: a rain-wet Tokyo backstreet seen from a rooftop, tangles of overhead power lines crossing the frame, vending machines and shop signs glowing small and far away, an elevated train line curving through the lower right. Hand-painted cel look with visible brushwork. Wet asphalt reflecting the lights.

Composition: the skyline and the interesting detail sit in the LOWER THIRD and along the right edge. The upper 8% of the frame is flat empty night sky — no stars, no glow, nothing. The centre of the frame is quiet dark rooftops.

Strictly limit the palette to:
  #1d202f  #24283b  #565f89  #7aa2f7  #bb9af7  #7dcfff  #ff9e64  #f7768e  #e0af68
Background must be dominated by #1d202f / #24283b. Use #ff9e64 and #7aa2f7 only as small light sources — windows, signs, a lamp — never as a wash over the sky.

Hard requirements:
- NO GRADIENTS. No soft radial glow, no airbrushed sky fade, no abstract blobs. Flat painted areas and crisp silhouettes only. A little atmospheric haze around individual lights is fine; a gradient background is not.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows, not a poster.
- NO text, letters, kanji, signage lettering, logos or watermarks.
- Fine film grain to prevent colour banding.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## kanagawa — *Kanagawa*

**Feel:** ukiyo-e woodblock. Paper, ink, restraint.

```text
A Japanese ukiyo-e woodblock print desktop wallpaper in the style of Hokusai: a single great stylised wave breaking in from the lower left, its foam drawn as flat carved curls, with a small distant Mount Fuji low on the horizon at the right. Authentic woodblock qualities — visible wood grain, slight ink misregistration between colour blocks, aged washi paper fibre texture, flat unmodulated colour areas with hard carved outlines.

Composition: the wave and Fuji occupy the LOWER THIRD. The upper two thirds is near-empty dark paper — the negative space is the point. Nothing in the top 8%.

Strictly limit the palette to:
  #16161d  #1f1f28  #363646  #7e9cd8  #957fb8  #7aa89f  #ffa066  #c34043  #e6c384
Background must be dominated by #16161d / #1f1f28 — a very dark ink-stained paper, not white paper. Use #ffa066 and #c34043 only as tiny accents (a sliver of sun, a seal-red mark of foam).

Hard requirements:
- NO GRADIENTS. Woodblock printing cannot make a smooth gradient — every colour is a flat carved plate. No airbrush, no glow, no soft fades.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO text, no kanji, no artist seal, no logos or watermarks.
- Paper grain and wood grain texture throughout.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## gruvbox — *Gruvbox Dark*

**Feel:** 1970s national-park screen print. Warm, analog, faded.

```text
A 1970s screen-printed national-park poster as a desktop wallpaper, risograph / halftone style: layered flat silhouettes of a desert canyon at dusk — three or four receding mesa ridgelines as solid overlapping shapes, a few saguaro and scrub silhouettes along the bottom edge. Limited-run print artefacts: coarse halftone dot texture, visible ink misregistration offsets, blotchy uneven ink coverage, paper tooth showing through.

Composition: canyon ridgelines stack across the LOWER THIRD, cacti along the bottom edge. Above the ridgelines is flat, empty, evenly-inked dark sky. Nothing at all in the top 8%.

Strictly limit the palette to:
  #1d2021  #282828  #504945  #fe8019  #fabd2f  #b8bb26  #83a598  #d3869b  #fb4934
Background must be dominated by #1d2021 / #282828. Use #fe8019 and #fabd2f only as thin accent bands on the furthest ridgeline.

Hard requirements:
- NO GRADIENTS. Screen printing lays down flat spot colours — every tone is a solid ink layer or a halftone dot pattern, never a smooth fade. No sunset gradient sky.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows, not a poster to hang.
- NO text, no park name, no logos or watermarks.
- Heavy visible grain and halftone texture.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## nord — *Nord*

**Feel:** geometric, cold, engineered. Low-poly arctic.

```text
A low-poly geometric desktop wallpaper: an arctic mountain range and glacier rendered as faceted flat-shaded triangles, each facet a single solid colour with a crisp hard edge against its neighbours. Clean vector construction, no rendering softness. A frozen fjord as flat angular planes along the bottom. Cold, precise, engineered — like a technical crystal model of a landscape.

Composition: the faceted peaks rise across the LOWER THIRD and the left and right edges, leaving a wide flat plain of dark sky above. The top 8% is a single uniform flat colour. The centre is empty sky.

Strictly limit the palette to:
  #242933  #2e3440  #3b4252  #4c566a  #81a1c1  #88c0d0  #8fbcbb  #b48ead  #d08770
Background must be dominated by #242933 / #2e3440. Use #88c0d0 and #d08770 on only a handful of facets — the ice highlights and one thin band of low polar light.

Hard requirements:
- NO GRADIENTS. Every polygon is one flat colour with a hard edge. No soft shading inside a facet, no glow, no aurora wash, no atmospheric fade.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO text, letters, logos or watermarks.
- Subtle uniform grain over the whole image to prevent banding on the large flat areas.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## everforest — *Everforest*

**Feel:** nature photograph. Quiet walk in the woods, fog between trunks.

```text
A moody nature photograph as a desktop wallpaper: a dense misty pine forest at dawn, shot on medium-format film. Layered depth — near-black trunks in sharp silhouette at the edges of the frame, progressively paler ranks of trees receding into fog. Ground fern and moss detail along the bottom edge. Matte, desaturated, muted greens; heavy fog flattening the light. Natural film grain, slightly lifted blacks.

Composition: the sharpest trunks and the ferns are in the LOWER THIRD and along the left and right edges. The upper part of the frame is featureless fog between distant treetops. Nothing bright or busy in the top 8%; no sun disc, no light shaft.

Strictly limit the palette to:
  #232a2e  #2d353b  #4f585e  #859289  #a7c080  #83c092  #7fbbb3  #dbbc7f  #e69875
Background must be dominated by #232a2e / #2d353b. Use #e69875 and #dbbc7f only as a barely-there warmth on a few needles low in the frame.

Hard requirements:
- NO GRADIENTS as a design device — the only softness allowed is real atmospheric fog between real trees. No abstract colour wash, no radial glow, no vignette added in post.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO text, letters, logos or watermarks.
- Visible film grain throughout.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## rose-pine — *Rosé Pine*

**Feel:** botanical ink plate. Art nouveau line work, delicate and refined.

```text
A vintage botanical illustration plate as a desktop wallpaper, art nouveau engraving style: fine ink line-work of ferns, trailing vines, seed heads and two moths, drawn with hairline cross-hatching and confident single-weight contours — the way a 19th-century natural history plate is engraved. Rendered in pale line on very dark ground, like a white-ink print on charcoal paper. Sparse and asymmetric, lots of empty ground.

Composition: the botanical growth climbs in from the BOTTOM-LEFT CORNER and trails along the bottom edge, with one moth low on the right. The entire upper half is bare dark paper. Absolutely nothing in the top 8%.

Strictly limit the palette to:
  #12101c  #191724  #26233a  #6e6a86  #908caa  #9ccfd8  #c4a7e7  #ebbcba  #f6c177  #eb6f92
Background must be dominated by #12101c / #191724. Use #f6c177 and #eb6f92 only to tint a couple of small elements — a moth's wing, one seed head.

Hard requirements:
- NO GRADIENTS. All tone is made from ink line density and cross-hatching, never from a fade or a glow. The background is one flat dark paper colour.
- Very DARK and LOW CONTRAST overall — keep the line-work dim and thin, this sits behind translucent windows.
- NO text, no botanical labels, no latin names, no plate numbers, no logos or watermarks.
- Fine paper grain.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## catppuccin-mocha — *Catppuccin Mocha*

**Feel:** cosy anime interior at night. Warm blanket, rain outside.

```text
A cosy anime interior desktop wallpaper, soft cel-shaded Studio Ghibli background-art style: a small night-time study seen from inside — a desk under a window, rain streaking the glass, a mug, a stack of books, a trailing pothos plant on a shelf, a single warm desk lamp as the only light source. Everything rounded and soft-edged, nothing sharp. Hand-painted, gentle, lived-in.

Composition: the desk, mug and plants occupy the LOWER THIRD and the left edge. The window and the dark wall fill the rest, calm and uneventful. The top 8% is plain dark ceiling and wall — no lamp, no highlight, no detail there.

Strictly limit the palette to:
  #11111b  #1e1e2e  #313244  #6c7086  #89b4fa  #cba6f7  #94e2d5  #a6e3a1  #f9e2af  #fab387  #f38ba8
Background must be dominated by #11111b / #1e1e2e. Use #fab387 for the lamp's warm pool of light only, and #89b4fa for the cold rain-light on the window glass — both small and contained.

Hard requirements:
- NO GRADIENTS as a background device. Cel shading only: flat colour areas with defined shadow shapes. The lamp may have a small soft falloff on the objects it lights; the walls and sky must be flat.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO text, no book titles, no letters, logos or watermarks.
- Fine film grain.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## dracula — *Dracula*

**Feel:** gothic architecture. Vaults, tracery, stained glass geometry.

```text
A gothic architectural desktop wallpaper: the interior of a ruined cathedral at night, looking down a nave — pointed arches, ribbed vaulting, and tall lancet windows filled with stained-glass tracery rendered as flat leaded panels of colour. Precise architectural line-work, strong dark stone silhouettes, bats small and distant. Ornate but graphic — like an architectural engraving rather than a painting.

Composition: the arcade columns frame the LEFT and RIGHT EDGES; the stained-glass windows and rubble sit in the LOWER THIRD. The vaulting above dissolves into flat unlit blackness. Nothing in the top 8%.

Strictly limit the palette to:
  #21222c  #282a36  #44475a  #6272a4  #bd93f9  #ff79c6  #8be9fd  #50fa7b  #f1fa8c  #ff5555  #ffb86c
Background must be dominated by #21222c / #282a36. Use #bd93f9, #ff79c6 and #ffb86c only inside the stained-glass panels — those are the single source of colour in the image.

Hard requirements:
- NO GRADIENTS. Stone is flat tone separated by hard edges; stained glass is flat leaded panels. No glow bloom around the windows, no misty fade down the nave, no abstract nebula.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO text, letters, logos or watermarks.
- Fine grain and a subtle stone texture.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## synthwave — *Synthwave*

**Feel:** 1984 outrun, but wireframe — vector lines, not an airbrushed sunset.

```text
A retro 1984 outrun desktop wallpaper drawn as pure vector wireframe: a neon perspective grid receding to a vanishing point low on the horizon, wireframe mountain ridges as bare polygon outlines on the left and right, and a chrome sun rendered as horizontal hard-edged scanline bands (solid stripes with gaps, NOT a fade). Everything is glowing line-work on flat black — early vector-graphics arcade aesthetic. Add CRT scanlines and slight chromatic-aberration fringing on the lines.

Composition: the grid floor occupies the LOWER THIRD and runs to a horizon line about 40% up. The sun sits low and off-centre to the right, mostly below the horizon. Everything above the horizon is flat empty black. Nothing in the top 8%.

Strictly limit the palette to:
  #1a1526  #241b2f  #463465  #ff7edb  #ff2e97  #36f9f6  #fe4450  #fede5d  #72f1b8
Background must be dominated by #1a1526 / #241b2f. #ff7edb and #36f9f6 appear ONLY as thin bright lines, never as filled areas or sky wash.

Hard requirements:
- NO GRADIENTS. This is the important one — do NOT paint the classic airbrushed purple-to-pink sunset sky. The sky is flat dark. The sun is made of discrete hard-edged horizontal bands. All colour is line-work.
- Very DARK and LOW CONTRAST overall — keep the neon lines thin and dimmed, this sits behind translucent windows.
- NO text, letters, logos or watermarks.
- CRT scanline overlay and fine grain.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## matrix — *Matrix*

**Feel:** phosphor terminal. Cryptic, technical, dense.

```text
A dark technical desktop wallpaper: an extreme macro photograph of a circuit board — traces, vias, solder pads, chip legs — lit only by its own green phosphor glow, overlaid with faint vertical columns of falling glyph-rain that fade out as they descend. Green monochrome CRT look: phosphor bloom on the brightest traces, scanlines, slight barrel distortion at the corners.

Composition: the dense circuitry detail is in the LOWER THIRD and along the bottom-left; the board falls out of focus and into blackness toward the top. The glyph columns are faint and confined to the left and right EDGES. The centre and the top 8% are near-pure black with almost nothing in them.

Strictly limit the palette to:
  #050805  #0b0f0b  #0a6b22  #0f3d18  #00c233  #00ff41  #39ff14  #9dff00  #00ffa3  #5affd7
Background must be dominated by #050805 / #0b0f0b — genuinely near-black. Use #39ff14 and #00ff41 only on thin traces and a few pin-point highlights.

Hard requirements:
- NO GRADIENTS as a background device. No green radial glow filling the frame, no abstract fluid. Structure comes from real circuit geometry and discrete glyph columns. Small phosphor bloom around individual bright traces is fine.
- The falling glyphs must be unreadable — abstract glyph-like marks, NOT actual letters, numbers, kana or code.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO readable text, logos or watermarks.
- CRT scanlines and fine grain.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```

---

## samurai — *Samurai*

**Feel:** sumi-e ink. One brush stroke, one red disc, nothing else.

```text
A minimal sumi-e ink painting as a desktop wallpaper: a lone samurai silhouette standing at the far right of the frame, painted in a few confident black brush strokes with visible bristle streaks and dry-brush breakup, against a single flat red sun disc behind them. A suggestion of wind-bent grass along the bottom edge, three or four strokes only. Ink bleeding softly into the fibres of dark washi paper. Extreme restraint — 90% empty space.

Composition: the figure and the sun disc sit LOW and to the RIGHT; the grass runs along the bottom edge. The entire left two thirds and the whole upper half are bare dark paper. Nothing in the top 8%.

Strictly limit the palette to:
  #0a0405  #14090b  #4a1418  #7a4a45  #e01b24  #ff2d2d  #ff5c57  #e6b422  #c98a6b  #e8d5c4
Background must be dominated by #0a0405 / #14090b. The red sun (#e01b24) is a FLAT disc of one colour and should be muted and desaturated, not glowing. #e6b422 only as a faint edge on one or two grass strokes.

Hard requirements:
- NO GRADIENTS. The sun is a flat hard-edged circle, not a glowing orb. The paper is one flat dark tone. All variation comes from brush texture and ink bleed.
- Very DARK and LOW CONTRAST overall — this is a desktop background behind translucent windows.
- NO text, no kanji, no calligraphy, no artist seal, no logos or watermarks.
- Heavy washi paper fibre texture and grain.
- Landscape, aspect ratio 16:10, 2048x1280 or larger.
```
