# Whack-a-FOD (standalone)

The whole game is in this folder: `index.html`, `config.js`, `boss.png` and the `fod_*.png` tokens.
Opening `index.html` works straight away, with a leaderboard saved on that device only.

## Shared leaderboard for anyone with the link (about 10 minutes, free)

1. **Create a database.** Sign up at https://supabase.com and click *New project*. Any name, region and password will do.
2. **Create the score table.** In the project, open *SQL Editor* → *New query*, paste everything in `setup.sql`, and click *Run*.
3. **Add your keys.** Open *Project Settings* → *API*. Copy the *Project URL* and the *anon public* key into `config.js`.
   The anon key is meant to be public, so it's fine in a web page. **Never** paste the `service_role` key there.
4. **Put it online.** Any static host works. The easiest is https://app.netlify.com/drop: drag this whole folder onto the page and you get a public link.
   GitHub Pages also works: upload the folder to a repo and turn on Pages in its settings.

Share that link and every player's best score shows on the leaderboard, updated every 15 seconds.

## Managing scores
In Supabase, open *Table Editor* → `scores` to delete junk or rude entries. Players can only add scores, not edit or delete them.

## Note on cheating
Scores are sent from the player's browser, so a determined person could post a fake one. The database rejects obviously impossible values (over 20,000). For a friendly office game that's usually enough. Delete anything suspicious in the Table Editor.
