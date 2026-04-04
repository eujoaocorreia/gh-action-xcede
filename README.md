# gh-action-xcede

> GitHub Action for the **xcede** tool.

## About xcede

**xcede** is a CLI tool created by [luxmentis](https://codeberg.org/luxmentis). This GitHub Action wraps the tool for easy integration into your CI/CD pipelines, automatically downloading, building, and caching the binary to speed up your workflows.

- **Repository**: [https://codeberg.org/luxmentis/xcede](https://codeberg.org/luxmentis/xcede)
- **Releases**: [https://codeberg.org/luxmentis/xcede/releases](https://codeberg.org/luxmentis/xcede/releases)
- **Documentation**: [https://codeberg.org/luxmentis/xcede/src/branch/main/HELP.md](https://codeberg.org/luxmentis/xcede/src/branch/main/HELP.md)

## Usage

Add the action to any workflow step:

```yaml
- name: Run xcede
  uses: eujoaocorreia/gh-action-xcede@v1
  with:
    version: 'latest'   # optional, defaults to "latest"
    args: '--help'      # optional, extra CLI arguments
```

### Inputs

| Input     | Required | Default    | Description                           |
|-----------|----------|------------|---------------------------------------|
| `version` | No       | `'latest'` | Version of xcede to install           |
| `args`    | No       | `''`       | Additional arguments to pass to xcede |

### Outputs

| Output   | Description              |
|----------|--------------------------|
| `result` | Output produced by xcede |

## Example workflow

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:

jobs:
  xcede:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Run xcede
        id: xcede
        uses: eujoaocorreia/gh-action-xcede@v1
        with:
          version: 'latest'
          args: '--help'

      - name: Print result
        run: echo "xcede output: ${{ steps.xcede.outputs.result }}"
```

## Development

### Repository layout

```
.
├── action.yml              # Action metadata (inputs, outputs, run steps)
├── .github/
│   └── workflows/
│       └── test.yml        # CI workflow that exercises the action
├── LICENSE
└── README.md
```

### Making changes

1. Edit `action.yml` to update the action logic.
2. Open a pull request — the `test.yml` workflow will run the action automatically.

## License

[MIT](LICENSE)
