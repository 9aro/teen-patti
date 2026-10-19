-- Run this once in Supabase: SQL Editor > New query > paste > Run
create table if not exists rooms (
  code text primary key,
  state jsonb not null,
  version int not null default 0,
  updated_at timestamptz not null default now()
);
alter table rooms enable row level security;
create policy "anyone can read rooms"   on rooms for select using (true);
create policy "anyone can create rooms" on rooms for insert with check (true);
create policy "anyone can update rooms" on rooms for update using (true) with check (true);
