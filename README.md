# ledgersheet-generator
Generator for Ledger Sheet

## Requirements

- Docker
- Chrome

## Generate Ledger Sheet

1. Open Ledger Sheet view.

   ```bash
   $ make open
   ```

2. Input several items.

3. Generate PDF of Ledger Sheet via browser's print feature.

## Development

1. Edit files under src directory.

   ```bash
   $ vi src/html/sheet.html
   $ vi src/css/sheet.css
   ```

2. Lint and build step1's files.

   ```bash
   $ make lint build
   ```
