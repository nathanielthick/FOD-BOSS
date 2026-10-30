-- Whack-a-FOD leaderboard setup. Paste into Supabase → SQL Editor → Run.

create table if not exists public.scores (
  id          bigint generated always as identity primary key,
  player_id   text        not null check (char_length(player_id) between 8 and 64),
  name        text        not null check (char_length(name) between 1 and 20),
  score       integer     not null check (score between 0 and 20000),
  best_combo  integer     not null default 0 check (best_combo between 0 and 500),
  hits        integer     not null default 0 check (hits between 0 and 500),
  created_at  timestamptz not null default now()
);

alter table public.scores enable row level security;

-- Anyone with the page can add a score and read scores. Nobody can edit or delete from the page.
drop policy if exists "anyone can add a score" on public.scores;
create policy "anyone can add a score" on public.scores for insert to anon with check (true);
drop policy if exists "anyone can read scores" on public.scores;
create policy "anyone can read scores" on public.scores for select to anon using (true);

-- One row per player: best score, best combo, games played, latest name.
create or replace view public.leaderboard with (security_invoker = on) as
select player_id,
       (array_agg(name order by created_at desc))[1] as name,
       max(score)       as best,
       max(best_combo)  as best_combo,
       count(*)         as games,
       max(created_at)  as last_played
from public.scores
group by player_id;

grant select on public.leaderboard to anon;
grant select, insert on public.scores to anon;
