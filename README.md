# GymNC

Diario allenamenti per telefono e computer, basato sulla scheda Push / Pull / Legs della repository `Gym`. Registra una sessione con data, esercizi, serie, ripetizioni, carichi e note; lo storico e l’andamento dei carichi si sincronizzano tramite Supabase.

## Pubblica il sito gratis con GitHub Pages

1. Apri la repository `GymNC` su GitHub e scegli **Add file → Upload files**.
2. Carica `index.html`, `schema.sql` e `README.md` nella cartella principale, poi premi **Commit changes**.
3. Vai in **Settings → Pages**.
4. In **Build and deployment**, seleziona **Deploy from a branch**, branch `main`, cartella `/ (root)` e salva.
5. Attendi la pubblicazione. L’indirizzo sarà `https://marione1982.github.io/GymNC/`.

GitHub Pages è gratuito per repository pubbliche con GitHub Free. Il codice del sito è pubblico; allenamenti ed account non sono contenuti nel codice.

## Sincronizzazione

GymNC è già collegato al suo progetto Supabase: URL e chiave pubblica (publishable) sono nel codice. Su qualsiasi dispositivo basta aprire il sito e premere **Accedi** con la propria email e password.

La chiave publishable è pubblica per natura: i dati sono protetti dal login e dalle regole RLS in `schema.sql`, che consentono a ciascun account di leggere, inserire ed eliminare solo le proprie sessioni. Non mettere mai nel codice `service_role` o chiavi `secret`.

Dall’ingranaggio si può impostare un progetto Supabase diverso; quei valori restano solo nel browser del dispositivo.

## Piano gratuito

Supabase Free costa $0 e basta per un diario personale entro i limiti del piano. I progetti gratuiti possono andare in pausa dopo una settimana senza attività; se succede, si riattivano dal pannello Supabase. Non scegliere un piano a pagamento per seguire questa guida.
