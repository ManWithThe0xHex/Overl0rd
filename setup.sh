#!/bin/bash
set -euo pipefail

echo "[*] Configurando entorno..."

# Permisos scripts
chmod +x modules/domain/scripts/*.sh

# Crear directorios base
mkdir -p output templates/output

# Verificar herramientas
tools=("whois" "dig" "amass" "httpx")
missing=()

for tool in "${tools[@]}"; do
    if ! command -v "$tool" &>/dev/null; then
        missing+=("$tool")
    fi
done

if [[ ${#missing[@]} -gt 0 ]]; then
    echo "[-] Herramientas faltantes: ${missing[*]}"
else
    echo "[+] Todas las herramientas disponibles."
fi

echo "[✓] Setup completado."
```

---

**Verificación de la estructura final:**
```
recon/
├── config/
│   └── config.py
├── core/
│   ├── __init__.py
│   ├── parser.py
│   └── note_generator.py
├── modules/
│   ├── __init__.py
│   ├── base.py
│   └── domain/
│       ├── __init__.py
│       ├── domain.py
│       └── scripts/
│           ├── whois.sh
│           ├── dig.sh
│           ├── amass.sh
│           └── httpx.sh
├── output/
├── templates/
│   ├── domain.md
│   └── output/
├── setup.sh
└── recon.py
