# GymNC

## Cos'è
Diario di allenamento personale per telefono e computer, basato sulla scheda Push / Pull / Legs del repository `Gym` (la versione precedente). Registra una sessione con data, esercizi, serie, ripetizioni, carichi e note; storico e andamento dei carichi si sincronizzano con Supabase. Il riepilogo settimanale conta da lunedì a domenica.

- Guide degli esercizi in `EXERCISE_GUIDES` (chiave = nome dell'esercizio, confronto senza maiuscole): `fig`, `tag`, `muscles`, `setup`, `steps`, `errors`. Un esercizio senza guida mostra solo un avviso e il link YouTube.
- Illustrazioni generate da `FIG`: figura costruita dagli angoli delle articolazioni (vista laterale `side` o frontale `front`), con attrezzo (`s`), carico (`g`) e frecce di movimento (`m`) per le due fasi INIZIO e FINE.
- Avviando un giorno, serie, ripetizioni e carichi vengono dall'ultima sessione dello stesso giorno (più gli esercizi aggiunti in quella sessione); senza sessioni precedenti si usano i valori di `PLAN`.
- Timer di recupero da 60 secondi (`REST_SECONDS`) nella schermata Allenamento, con suono e vibrazione alla fine.
- Le sessioni nello storico si possono modificare: il modulo passa in modalità modifica e salva con un `update`.

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
- RLS attiva: il proprietario può leggere, inserire, modificare ed eliminare le proprie sessioni.
- Permessi di tabella: `anon` nessuno; `authenticated` select, insert, delete e update solo sulle colonne `performed_on`, `split_name`, `notes`, `exercises`.
- Lo schema iniziale fu applicato dal SQL Editor; migrazioni registrate: `restringe_permessi_workout_sessions` e `permette_modifica_workout_sessions` (2 novembre 2026).

## Regole di lavoro
- Prima di cambiare il database, leggi lo stato reale. Mostra l'SQL e aspetta conferma prima di applicarlo.
- Le modifiche al database passano da una migrazione con nome descrittivo, e `schema.sql` si aggiorna nello stesso lavoro.
- Ogni tabella nuova: RLS attiva e policy per il proprietario.
- Mai `service_role` né chiavi segrete nel browser o nel repo: il repository è pubblico.

## Convenzioni
- Testi dell'interfaccia in italiano.
- Mantieni il file unico e senza dipendenze, a meno di un motivo chiaro per dividerlo.
- Messaggi di commit brevi, in italiano.
