
# Asdf Plugin Manager (via asdf) (asdf-plugin-manager-asdf)

ASDF Plugin Manager allows you to pin asdf plugin info like Git URL and ref for security and integrity.

## Example Usage

```json
"features": {
    "ghcr.io/aps831/devcontainers-features/asdf-plugin-manager-asdf:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| plugin | Select the asdf plugin to install. | string | - |
| ref | Select the git ref of the asdf plugin to install. | string | latest |
| pluginRepo | Select the asdf plugin repo to install | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
