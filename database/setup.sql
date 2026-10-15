create table public.contact_requests (
 id uuid primary key default gen_random_uuid(),
 name text not null check (char_length(trim(name)) between 1 and 100),
 email text not null check (char_length(email) <= 160 and email ~ '^[^[:space:]@]+@[^[:space:]@]+[.][^[:space:]@]+$'),
 phone text not null check (char_length(regexp_replace(phone, '[^0-9]', '', 'g')) between 10 and 15),
 service text not null check (service in ('Quisiera orientación','Psicoterapia individual','Psicoterapia de pareja','Tanatología')),
 message text not null check (char_length(trim(message)) between 1 and 1500),
 created_at timestamptz not null default now()
);
alter table public.contact_requests enable row level security;
revoke all on public.contact_requests from anon, authenticated;
grant insert (name,email,phone,service,message) on public.contact_requests to anon;
create policy "Visitors can submit requests" on public.contact_requests for insert to anon with check (true);
-- No anonymous SELECT, UPDATE or DELETE. Consult requests from the Supabase dashboard.
