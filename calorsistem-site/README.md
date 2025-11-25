# Calor Sistem Site – Starter

Progetto base in Go per il sito Calor Sistem, strutturato per essere deployato su CapRover.

## Struttura

- `cmd/web/main.go` – entrypoint HTTP (porta letta da variabile d'ambiente `PORT`, default 3000)
- `go.mod` – modulo Go
- `Dockerfile` – build multistage per immagine leggera
- `captain-definition` – file usato da `caprover deploy`
- `.github/workflows/deploy.yml` – workflow di deploy automatico verso CapRover

## Uso rapido

1. In locale:
   ```bash
   go run ./cmd/web
   ```

   Apri http://localhost:3000

2. Su CapRover:
   - crea un'app con nome `calorsistem-site` (o quello che vuoi)
   - imposta `Container HTTP Port` a `3000`
   - usa `caprover deploy` dalla root del progetto

3. Su GitHub:
   - imposta nei *Secrets*:
     - `CAPROVER_HOST` (es. `http://46.224.90.229:3000`)
     - `CAPROVER_PASSWORD`
     - `CAPROVER_APP_NAME` (es. `calorsistem-site`)
   - ogni push su `main` triggera il deploy.
