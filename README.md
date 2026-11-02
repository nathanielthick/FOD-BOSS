# 🔨 Whack-a-FOD

**[▶ Play Whack-a-FOD](https://zingy-sprite-1a3037.netlify.app/)**

A whack-a-mole game about **FOD (Foreign Object Debris)**. The FOD Boss is scattering wire ends, loose pins, connectors and dust bunnies across the hangar floor. Grab your hammer and clear it before he takes over.

---

## How to play

- **Enter your name** and press **START**. Each round lasts **60 seconds**.
- Debris pops out of the 9 holes in the floor. **Click it** to smack it with your hammer before it drops back in.
- The **FOD Boss** chases your hammer around the floor and taunts you.
- Your best score goes on the **shared leaderboard**, so everyone who plays competes on the same board.

## Scoring

| Event | Points |
|---|---|
| Regular FOD | 10 × multiplier |
| ★ Gold FOD (rare) | 30 × multiplier |

### Combos
- Every hit in a row builds your **combo**. Every 5 hits raises your **multiplier**, up to **x5**.
- The combo breaks if you **miss a swing** or go **2 seconds without a hit**. The bar under the combo counter shows how long you have left.

| Combo | Multiplier | |
|---|---|---|
| 0–4 | x1 | |
| 5–9 | x2 | **COMBO x2!** |
| 10–14 | x3 | **FOD FRENZY:** the Boss's eyes glow red 👀 |
| 15–19 | x4 | **RAMPAGE** |
| 20+ | x5 | **UNSTOPPABLE** |

### Watch out
- **WIRE MISSING:** you swung just outside a piece of FOD. So close, but it still breaks your combo.
- **DIELECTRIC FAILURE:** 5 misses in a row (missed swings or escaped FOD). The floor shorts out and the Boss laughs at you. A bad enough round ends with a DIELECTRIC FAILURE instead of FLOOR CLEAR.

### 💪 Boss stage
Reach **1,500 points** (or a **25-hit combo**) and the FOD Boss **gets BUFF**. He takes over the floor, grows huge arms and starts slamming his fists down.
- A **red shadow** shows where each fist will land. **Whack the fist** before it hits to knock it away and damage him (**50 × multiplier** per hit).
- Every fist that lands costs you a **life ❤**. Lose all 3 and you're **KNOCKED OUT**, and the round ends.
- Halfway through, he starts **using both arms at once**.
- Beat him (12 hits) for a **1,000-point bonus + 250 per life left**. If you hold out for 30 seconds he runs out of steam and retreats.
- The round clock **pauses** during the fight, and the boss only appears once per round.

---

## Project files

| File | What it is |
|---|---|
| `Whack-a-FOD/index.html` | The whole game: layout, styles and code |
| `Whack-a-FOD/config.js` | Supabase connection settings for the leaderboard |
| `Whack-a-FOD/setup.sql` | Creates the leaderboard database table |
| `Whack-a-FOD/boss.png` | The FOD Boss |
| `Whack-a-FOD/fod_*.png` | The debris tokens |

It's plain HTML, CSS and JavaScript, with no build step and no dependencies.

## Running your own copy

### 1. Play locally
Open `Whack-a-FOD/index.html` in a browser. Without Supabase keys, the leaderboard is saved only on that device.

### 2. Set up the shared leaderboard (free)
1. Create a project at [supabase.com](https://supabase.com).
2. Open **SQL Editor → New query**, paste in all of `setup.sql`, and click **Run**.
3. In **Project Settings**, copy:
   - **Data API → Project URL**, which looks like `https://abcdefgh.supabase.co` (without `/rest/v1/`)
   - **API Keys → Publishable key** (`sb_publishable_...`) or the legacy **anon public** key
4. Paste both into `Whack-a-FOD/config.js`:
   ```js
   window.WHACK_CONFIG = {
     SUPABASE_URL: "https://abcdefgh.supabase.co",
     SUPABASE_ANON_KEY: "your-publishable-or-anon-key"
   };
   ```

> The publishable/anon key is designed to be public, so it's fine to commit it. **Never** put the `service_role` or secret key in this repo.

### 3. Deploy
- **Netlify:** drag the **Whack-a-FOD** folder (not the whole repo) onto [app.netlify.com/drop](https://app.netlify.com/drop). To update the site, drag the folder onto your site's **Deploys** page.
- **GitHub Pages:** push this repo, then open **Settings → Pages**, choose your main branch. The game is in the `Whack-a-FOD` folder, so the link is `...github.io/FOD-BOSS/Whack-a-FOD/`.

## Moderating scores
In Supabase, open **Table Editor → scores** to remove junk or inappropriate entries. Players can add scores but can't edit or delete them. Scores are sent from the browser, so a determined player could post a fake one. The database rejects impossible values (over 20,000), and anything suspicious can be deleted in the Table Editor.

---

Made for FOD awareness. **Clean floors, safe flights.** ✈️
