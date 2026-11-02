# GymNC

## Cos'è
Diario di allenamento personale per telefono e computer, basato sulla scheda Push / Pull / Legs del repository `Gym` (la versione precedente). Registra una sessione con data, esercizi, serie, ripetizioni, carichi e note; storico e andamento dei carichi si sincronizzano con Supabase. Il riepilogo settimanale conta da lunedì a domenica.

## Stack
- Un solo file `index.html` con HTML, CSS e JavaScript inline. Nessun build.
- `@supabase/supabase-js` v2 caricato da CDN.
- Hosting: GitHub Pages dal branch `main`, cartella radice, <https://marione1982.github.io/GymNC/>. Il deploy è quello di Pages da branch, non c'è un workflow.

## File
- `index.html`: tutta l'app.
- `schema.sql`: schema del database, rieseguibile.
- `README.md`: guida alla pubblicazione e alla configurazione.

## Configurazione
URL del progetto e chiave publishable di Supabase sono nel codice (`DEFAULT_CFG` in `index.html`): la chiave publishable è pubblica per natura e i dati sono protetti dal login e dalla RLS. Così basta accedere da qualsiasi dispositivo. Dall'ingranaggio si può ancora impostare un altro progetto, salvato solo nel browser (localStorage). Mai `service_role` o chiavi `secret` nel codice.

## Supabase
- Progetto "GymNC" (ref `lnuqmirkefccyrrrqslm`, regione eu-west-1).
- Tabella `workout_sessions`: `id` uuid, `user_id` (default `auth.uid()`), `performed_on` date, `split_name`, `notes`, `exercises` jsonb (sempre un array), `created_at`. Indice su `(user_id, performed_on desc, created_at desc)`.
- RLS attiva: il proprietario può leggere, inserire ed eliminare le proprie sessioni. Non c'è nessun permesso di modifica (`update`): per modificare una sessione servono policy e grant nuovi.
- Su Supabase non risulta nessuna migrazione registrata: lo schema è stato applicato dal SQL Editor.

## Regole di lavoro
- Prima di cambiare il database, leggi lo stato reale. Mostra l'SQL e aspetta conferma prima di applicarlo.
- Le modifiche al database passano da una migrazione con nome descrittivo, e `schema.sql` si aggiorna nello stesso lavoro.
- Ogni tabella nuova: RLS attiva e policy per il proprietario.
- Mai `service_role` né chiavi segrete nel browser o nel repo: il repository è pubblico.

## Convenzioni
- Testi dell'interfaccia in italiano.
- Mantieni il file unico e senza dipendenze, a meno di un motivo chiaro per dividerlo.
- Messaggi di commit brevi, in italiano.
