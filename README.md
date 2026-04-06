# gh-action-xcede

> GitHub Action for the **xcede** tool.

## About xcede

**xcede** is a CLI tool created by [luxmentis](https://codeberg.org/luxmentis). This GitHub Action wraps the tool for easy integration into your CI/CD pipelines, automatically downloading, building, and caching the binary to speed up your workflows.

- **Repository**: [https://codeberg.org/luxmentis/xcede](https://codeberg.org/luxmentis/xcede)
- **Releases**: [https://codeberg.org/luxmentis/xcede/releases](https://codeberg.org/luxmentis/xcede/releases)
- **Documentation**: [https://codeberg.org/luxmentis/xcede/src/branch/main/HELP.md](https://codeberg.org/luxmentis/xcede/src/branch/main/HELP.md)

## Usage

> **Note:** Because `xcede` is a tool for building Apple applications (like iOS), this action must be run on a macOS runner (e.g., `macos-latest` or `macos-13`).

This action can be used in two ways: to run `xcede` directly via the action's `args` input, or to install it so it is available in your `$PATH` for subsequent shell steps.

### Option 1: Run directly via action

```yaml
- name: Run xcede
  uses: eujoaocorreia/gh-action-xcede@v1
  with:
    version: 'latest'   # optional, defaults to "latest"
    args: '--help'      # optional, extra CLI arguments
```

### Option 2: Install and use in subsequent steps

```yaml
- name: Install xcede
  uses: eujoaocorreia/gh-action-xcede@v1
  with:
    version: 'latest'

- name: Use xcede in a script
  run: |
    xcede --help
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
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v4

      # Example 1: Using the action to execute xcede and capture output
      - name: Run xcede
        id: xcede
        uses: eujoaocorreia/gh-action-xcede@v1
        with:
          version: 'latest'
          args: '--help'

      - name: Print result
        run: echo "xcede output: ${{ steps.xcede.outputs.result }}"

      # Example 2: Using the installed binary in a regular run step
      - name: Run xcede directly in a bash script
        run: |
          echo "Running xcede from bash!"
          xcede --help
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
