-- GymNC: personal workout history with per-user row security.
-- Run once in Supabase Dashboard > SQL Editor > New query.

create table if not exists public.workout_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  performed_on date not null default current_date,
  split_name text not null,
  notes text not null default '',
  exercises jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  constraint workout_sessions_exercises_array check (jsonb_typeof(exercises) = 'array')
);

create index if not exists workout_sessions_user_date_idx
  on public.workout_sessions (user_id, performed_on desc, created_at desc);

alter table public.workout_sessions enable row level security;

drop policy if exists "Users can read their own workouts" on public.workout_sessions;
create policy "Users can read their own workouts"
  on public.workout_sessions for select to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can add their own workouts" on public.workout_sessions;
create policy "Users can add their own workouts"
  on public.workout_sessions for insert to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can delete their own workouts" on public.workout_sessions;
create policy "Users can delete their own workouts"
  on public.workout_sessions for delete to authenticated
  using ((select auth.uid()) = user_id);

grant select, insert, delete on public.workout_sessions to authenticated;
