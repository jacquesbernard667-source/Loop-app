-- Run this in Supabase SQL Editor.
create table if not exists public.tasks (
  id uuid primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  category text not null default 'Other',
  priority text not null default 'normal',
  due_date date,
  due_time time,
  done boolean not null default false,
  updated_at timestamptz not null default now()
);
alter table public.tasks enable row level security;
create policy "Users can read own tasks" on public.tasks for select using (auth.uid() = user_id);
create policy "Users can insert own tasks" on public.tasks for insert with check (auth.uid() = user_id);
create policy "Users can update own tasks" on public.tasks for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users can delete own tasks" on public.tasks for delete using (auth.uid() = user_id);
create index if not exists tasks_user_id_idx on public.tasks(user_id);
