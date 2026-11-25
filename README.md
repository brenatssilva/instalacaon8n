# n8n (local)

Setup minimo do n8n Community Edition neste computador, via Docker. Acesso apenas em `http://localhost:5678`.

## Requisitos

- Windows 10/11
- WSL 2 habilitado (no PowerShell como Administrador: `wsl --install`, depois reinicie o PC)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado e em execucao

Confira no PowerShell:

```powershell
wsl --status
docker version
docker compose version
```

## Subir

Na pasta do projeto:

```powershell
docker compose up -d
```

Ou:

```powershell
.\scripts\start.ps1
```

Abra o navegador em [http://localhost:5678](http://localhost:5678).

Na primeira vez, crie a conta de dono da instancia (email e senha). Essa conta fica so neste PC.

## Parar

```powershell
docker compose stop
```

Ou:

```powershell
.\scripts\stop.ps1
```

## Atualizar

```powershell
docker compose pull
docker compose up -d
```

## Status e logs

```powershell
docker compose ps
docker compose logs -f
```

## Outro computador

1. Clone este repositorio
2. Instale o Docker Desktop
3. Rode `docker compose up -d`
4. Acesse `http://localhost:5678` e crie a conta local

Os workflows e dados ficam no volume Docker `n8n_data` da maquina. Nao sao versionados neste repositorio.

## Observacoes

- Sem license key = Community Edition (gratuito)
- Porta padrao: `5678`
- Fuso: `America/Sao_Paulo`
