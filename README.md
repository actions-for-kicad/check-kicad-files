# check-kicad-files

ERC and DRC test for KiCad files.

> **_NOTE:_** Minimal KiCad version is 8.0.

# Usage

See [action.yml](action.yml)

```yaml
steps:
  - uses: actions/checkout@v4
  - uses: actions-for-kicad/setup-kicad@v1
    with:
      version: "8.0"
  - uses: actions-for-kicad/check-kicad-files@v1
    with:
      file: "./file.kicad_sch"
      type: "erc"
  - name: Upload
    uses: actions/upload-artifact@v4
    with:
      name: "file.pdf"
      path: "./file.pdf"
```

## Inputs

### `file`

Required: `True`

Description: The location to the schematic or PCB file.

### `type`

Required: `True`

Check type, choose one of the following:

- erc
- drc

# License

The scripts and documentation in this project are released under the [GNU license](LICENSE).

# Contributions

Contributions are welcome! Please help me expand and maintain this repository.
