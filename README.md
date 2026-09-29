# GymNC

Diario allenamenti per telefono e computer, basato sulla scheda Push / Pull / Legs della repository `Gym`. Registra una sessione con data, esercizi, serie, ripetizioni, carichi e note; lo storico e l’andamento dei carichi si sincronizzano tramite Supabase.

## Pubblica il sito gratis con GitHub Pages

1. Apri la repository `GymNC` su GitHub e scegli **Add file → Upload files**.
2. Carica `index.html`, `schema.sql` e `README.md` nella cartella principale, poi premi **Commit changes**.
3. Vai in **Settings → Pages**.
4. In **Build and deployment**, seleziona **Deploy from a branch**, branch `main`, cartella `/ (root)` e salva.
5. Attendi la pubblicazione. L’indirizzo sarà `https://marione1982.github.io/GymNC/`.

GitHub Pages è gratuito per repository pubbliche con GitHub Free. Il codice del sito è pubblico; allenamenti ed account non sono contenuti nel codice.

## Attiva la sincronizzazione privata

1. In Supabase crea un nuovo progetto con il piano **Free**.
2. Apri **SQL Editor**, crea una query e copia il contenuto di `schema.sql`; esegui la query.
3. In Supabase apri **Project Settings → API Keys** e copia il **Project URL** e la chiave **Publishable** (oppure la chiave legacy `anon`). Non copiare mai `service_role` o `secret`.
4. Apri GymNC sul dispositivo e premi l’ingranaggio. Incolla URL e chiave pubblica e salva.
5. Premi **Accedi → Crea un account**, usa la tua email e una password. Se Supabase richiede la conferma, apri l’email e poi accedi.
6. Su ogni altro dispositivo ripeti solo la configurazione URL/chiave e accedi con lo stesso account.

L’URL e la chiave pubblica vengono salvati solo nel browser del dispositivo. I dati degli allenamenti sono salvati nel database Supabase; le regole RLS in `schema.sql` consentono a ciascun account di leggere, inserire ed eliminare solo le proprie sessioni.

## Piano gratuito

Supabase Free costa $0 e basta per un diario personale entro i limiti del piano. I progetti gratuiti possono andare in pausa dopo una settimana senza attività; se succede, si riattivano dal pannello Supabase. Non scegliere un piano a pagamento per seguire questa guida.
