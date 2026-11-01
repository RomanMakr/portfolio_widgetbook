# Portfolio Builder — Flutter & Widgetbook

A responsive portfolio builder UI built with Flutter, Dart, and Material 3.
It includes a public portfolio, authentication forms, an admin dashboard, and
a Widgetbook catalog for previewing screens and reusable widgets.

The app uses a dark purple theme and sample project data. It is a UI prototype:
authentication and publishing are demos, and project changes are stored only
in memory.

## Features

- **Landing:** responsive introduction with sign-in, sign-up, and portfolio
  demo navigation.
- **Authentication:** sign-in and sign-up forms with validation, password
  visibility controls, and callbacks into the dashboard.
- **Public portfolio:** introduction, biography, technical skills, experience,
  featured projects, and contact form fields.
- **Dashboard:** project overview and local project creation, editing, and
  deletion with confirmation dialogs.
- **Publish & Share:** a demo visibility toggle and example portfolio URL.
- **Widgetbook:** screen use cases, button and project-card previews, a dark
  theme addon, and Linux desktop and Android phone viewports.

## Project structure

Both application entry points are inside `lib/`. The Widgetbook entry point is
`lib/widgetbook/main.dart`.

```text
portfolio_widgetbook/
├── lib/
│   ├── main.dart                       # PortfolioApp entry point and navigation
│   ├── design/
│   │   └── theme.dart                  # Palette and Material theme
│   ├── models/
│   │   └── project.dart                # Project model and sampleProjects
│   ├── screens/
│   │   ├── auth.dart
│   │   ├── auth/                       # Form, fields, header, and footer
│   │   ├── dashboard.dart
│   │   ├── dashboard/                  # Layout, overview, CRUD dialogs, sharing
│   │   ├── landing.dart
│   │   ├── landing/                    # Header, hero, preview, and features
│   │   ├── public_portfolio.dart
│   │   ├── public_portfolio/           # Layout, hero, details, projects, contact
│   │   ├── screens.dart                # Grouped screen exports
│   │   └── portfolio_screens.dart      # Portfolio, dashboard, and share exports
│   ├── widgetbook/
│   │   ├── main.dart                   # PortfolioWidgetbook entry point
│   │   ├── screen_use_cases.dart
│   │   ├── design_use_cases.dart
│   │   ├── widgetbook_addons.dart
│   │   ├── widgetbook_catalog.dart
│   │   └── widgetbook_content.dart
│   └── widgets/
│       ├── accent_button.dart
│       ├── glow_backdrop.dart
│       ├── logo.dart
│       ├── panel.dart
│       ├── project_tile.dart
│       ├── section_heading.dart
│       ├── common.dart                 # Public widget exports
│       ├── components.dart
│       └── layout.dart
├── test/
│   ├── screens/                        # Screen behavior and responsive tests
│   ├── widgets/                        # Shared widget tests
│   ├── support/                        # Test harness, helpers, and fixtures
│   └── widget_test.dart                # App navigation tests
├── DEVELOPMENT.md                     # File size and dependency rules
├── Makefile                           # Development commands
├── pubspec.yaml
├── pubspec.lock
└── README.md
```



## Getting started

Prerequisites:

- Flutter SDK with Dart `>=3.9.2 <4.0.0`. The current dependency lockfile
  requires Flutter `>=3.35.0`.
- GNU Make and Git.
- Chrome for the default web commands, or a configured Flutter device and its
  platform toolchain. iOS development requires macOS and Xcode.

Clone the repository and install dependencies:

```bash
git clone https://github.com/RomanMakr/portfolio_widgetbook.git
cd portfolio_widgetbook
make deps
```

For a fresh clone, generate the missing platform runners. The default is Web,
Android, and iOS:

```bash
make platforms
```

To generate only the runners you need:

```bash
make platforms PLATFORMS=web
make platforms PLATFORMS=web,linux
```

## Run the app and Widgetbook

Run the portfolio app in Chrome:

```bash
make run
```

Run Widgetbook in Chrome:

```bash
make widgetbook
```

Both commands accept a device ID. Generate the appropriate runner first:

```bash
make devices
make run DEVICE=linux
make widgetbook DEVICE=linux
```

Use an emulator or physical device ID from `make devices` to run on mobile.
Widgetbook previews use sample data; callbacks on standalone screen previews
are not connected to the main application's navigation.

## Linux, macOS, and Windows

Use GNU Make on each operating system. On Windows, make `make`, `flutter.bat`,
and `dart.bat` available in PowerShell or Command Prompt. The Makefile selects
the `.bat` launchers automatically on Windows and uses commands supported by
both Windows and Unix shells. Microsoft's `nmake` is not a replacement for
GNU Make.

Choose the commands for the machine you are using:

| Action | Linux | macOS | Windows |
| --- | --- | --- | --- |
| Generate Web and native runners | `make setup-linux` | `make setup-macos` | `make setup-windows` |
| Run the app | `make run-linux` | `make run-macos` | `make run-windows` |
| Run Widgetbook | `make widgetbook-linux` | `make widgetbook-macos` | `make widgetbook-windows` |
| Build the native app | `make build-linux` | `make build-macos` | `make build-windows` |

Run setup first when the corresponding runner folder is missing. These targets
generate runners; they do not install native development tools. Run and build
native desktop apps on the matching operating system with its Flutter
toolchain configured:

- Linux: follow the [Linux setup guide](https://docs.flutter.dev/platform-integration/linux/setup).
- macOS: install Xcode and follow the [macOS setup guide](https://docs.flutter.dev/platform-integration/macos/setup).
- Windows: install Visual Studio with the **Desktop development with C++**
  workload, as described in the [Windows setup guide](https://docs.flutter.dev/platform-integration/windows/setup).

`make deps`, `make analyze`, `make test`, `make coverage`, `make format`, and
`make check` are the same on all three operating systems. Web commands remain
available with Chrome installed.

## Development commands

Run these from the repository root after `make deps`:

| Command | Purpose |
| --- | --- |
| `make` or `make help` | Show available commands |
| `make deps` | Install dependencies |
| `make platforms PLATFORMS=web,android,ios` | Generate platform runners |
| `make devices` | List available Flutter devices |
| `make run DEVICE=chrome` | Run `lib/main.dart` |
| `make widgetbook DEVICE=chrome` | Run `lib/widgetbook/main.dart` |
| `make analyze` | Run static analysis without fetching dependencies |
| `make test` | Run the full test suite |
| `make coverage` | Run tests and write `coverage/lcov.info` |
| `make format` | Format Dart files in `lib/` and `test/` |
| `make check` | Run static analysis and all tests |
| `make build-web` | Build the app into `build/web/` |
| `make build-widgetbook` | Build Widgetbook into `build/widgetbook/` |
| `make clean` | Remove Flutter build artifacts |

Run a test file or a test directory:

```bash
make test TEST_PATH=test/screens/dashboard_create_test.dart
make test TEST_PATH=test/screens
make test TEST_PATH=test/widgets
```

Tests cover form validation, password visibility, screen callbacks, app
navigation, project CRUD and cancellation, publish state, custom portfolio
content, and mobile layouts. Shared widget tests cover buttons, project cards,
logos, headings, panels, and backdrops.

`FLUTTER` and `DART` can be overridden when using SDK binaries outside `PATH`.
See [DEVELOPMENT.md](DEVELOPMENT.md) for the Dart file limits: under 100 lines
and at most three combined `import`, `export`, and `part` directives per file.

## Responsive layouts

Breakpoints are defined per screen:

| Area | Layout behavior |
| --- | --- |
| Landing and public portfolio | Mobile below 700 logical pixels; desktop from 700 |
| Dashboard navigation | Mobile below 800 logical pixels; sidebar from 800 |
| Dashboard project grid | One column below 600; two below 800; three from 800 |
| Public portfolio project grid | One column on mobile; three on desktop |

## Current limitations

- Authentication validates local form fields and opens the dashboard; no
  authentication service is connected.
- Dashboard project edits are local to that dashboard instance. They do not
  persist or update the separate public portfolio demo.
- Other dashboard editors are placeholders.
- Contact sending, CV download, and social-link actions are not implemented.
- The publishing toggle changes only local demo state. The displayed URL is
  an example; publishing, copying links, QR generation, and native sharing are
  not connected.
