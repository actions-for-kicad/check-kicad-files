# check-kicad-files

ERC and DRC test for KiCad files.

> **_NOTE:_** Minimal KiCad version is 8.0.

# TODO update

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

Description: Export type, choose one of the following:

- schematic_pdf
- schematic_svg
- schematic_bom
- schematic_netlist
- pcb_step
- pcb_pos
- pcb_gerbers
- pcb_drill
- pcb_gerbers_drill

### `layers`

Required: `False`

Description: The layers that need to be exported in a comma seperated list. Example: "F.Cu,B.cu". The layers can be set by the following types:

- pcb_gerbers
- pcb_gerbers_drill

# License

The scripts and documentation in this project are released under the [GNU license](LICENSE).

# Contributions

Contributions are welcome! Please help me expand and maintain this repository.
