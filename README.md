# createNextApp

Bash script that sets up a new React (Vite) or Next.js project on your Desktop with your own folder structure.

## What it does

1. Asks for a project name (converted to lowercase, spaces become `-`)
2. Lets you choose React-Vite or Next.js, with or without TypeScript
3. Creates the project in `~/Desktop/<name>`
4. Adds `components`, `hooks`, `utils`, `styles` and `types` folders inside `src/`
5. Optionally installs TanStack Query
6. Opens the project in VS Code

## Requirements

- Bash (Linux, macOS, or Git Bash / WSL on Windows)
- Node.js and npm
- VS Code with the `code` command in PATH (optional)

## Structure

```
scripts/
├── createNextApp/
│   └── createNextAppMain.sh
└── lib/
    └── askUser.sh
```

## Usage

```bash
chmod +x scripts/createNextApp/createNextAppMain.sh
./scripts/createNextApp/createNextAppMain.sh
```

## Customizing

Edit `PROJECT_FOLDERS` at the top of `createNextAppMain.sh` to change the folders created in `src/`.
