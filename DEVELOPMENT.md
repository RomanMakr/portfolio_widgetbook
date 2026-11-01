# Project rules

These rules apply to Dart source files under `lib/`.

## File size and dependencies

- Keep each file under 100 lines, including blank lines and comments.
- Allow at most 3 directives per file in total: `import`, `export`, and `part`
  count together. A `part of` directive also counts as one.
- Split large files into focused widgets, forms, layouts, or dialog files.
  Keep normal Dart formatting; do not compress code to meet the line limit.
- Group related exports into small barrel files when needed. Barrel files must
  follow the same limits. Avoid circular dependencies and unused imports.

## Verification

- Format changed Dart files with `dart format` before checking the limits.
- Check both the line count and the combined directive count after formatting.
- Run `flutter analyze --no-pub` for Dart code changes when dependencies are
  available. Report any remaining errors without claiming the check passed.
