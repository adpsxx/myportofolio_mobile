# WEEK 1 
## User

Can you check if my README.md already perfect?

## Assistant

Not quite. The README is understandable, but these issues should be fixed:

1. Numbering is incorrect: it jumps from 3 to 5, then later restarts at 2.
2. The feature description overstates functionality: the menu items currently only display a `SnackBar`; they do not actually open projects, experience pages, or the web portfolio.
3. Language is inconsistent: Indonesian text is mixed with “Setup Instruction”, “Interface”, “experience”, and “theme”.
4. Heading structure could improve: use `## Deskripsi` and `## Setup`.
5. Setup prerequisites are incomplete: mention that users need an emulator, physical device, or browser configured before running `flutter run`.
6. The project still has the generic description `"A new Flutter project."` in `pubspec.yaml`, which could be aligned with the README.

The most important fixes are the numbering and accurately describing the menu actions.

## User

How about now?

## Assistant

Much better, but not perfect yet.

### Remaining issues

1. Step numbering still skips 4. Change steps 5 and 6 to 4 and 5.
2. The description still overstates functionality. The menu currently shows `SnackBar` feedback rather than opening project, experience, or portfolio pages.
3. Language is still mixed: `Project Structure`, `Setup Instruction`, `entry point`, `theme`, and `Interface` are English within Indonesian text.
4. “jawaban tugas” in the project structure comment is unnecessary and sounds assignment-specific.
5. The heading could be Indonesian: `## Instruksi Instalasi`.

The project structure section is a useful improvement. After fixing the numbering and accurately describing the current menu behavior, the README should be in good shape.


# WEEK 2

## User

C:\pacil_active\PBP\myportofolio_mobile

take a look at that, can you fix the project form so the value it put similar to the one I have in this folder:
C:\pacil_active\PBP\myportofolios

## Assistant

Updated `lib/screens/project_form.dart` to match the `Project` model and `ProjectForm` in `myportofolios/main/models.py`, `forms.py`, and `serializers.py`.

### Changes made
- **Removed unused fields** not present in the Django `Project` model: `Kategori Proyek` (`_category`) and `Teknologi yang Digunakan` (`_technologies`).
- **Aligned form fields, labels, hints, and defaults** with `ProjectForm`:
  - `title` (`Nama Proyek`): hint `"Portfolio Website"`, `maxLength: 255`, required.
  - `description` (`Deskripsi Proyek`): hint `"Ceritakan Proyekmu"`, multiline (`minLines: 3`, `maxLines: 5`), required.
  - `thumbnail` (`URL Gambar Proyek`): added URL field with hint and fallback default `https://ik.imagekit.io/hefciv25h/portfolio/placeholder.jpg` when left blank, plus `http`/`https` URL validation.
  - `project_link` (`URL Proyek`): updated label/hint and added fallback default `https://github.com/adpsxx` when left blank, plus `http`/`https` URL validation.
- **Updated confirmation dialog & reset**: displays the resolved values for all 4 fields and resets the state variables alongside `_formKey.currentState!.reset()`.

### Verification
- Ran `flutter analyze` in `myportofolio_mobile` — **No issues found**.

## User

nevermind, I want to do it manually, can you check my implementation on the new experience form page? Is it already similar to the one I have on my web

## Assistant

It's very close! The 3 main fields (`title`, `description`, `category`) and all 7 category names match your web app in `main/models.py` and `main/forms.py`.

Here are the differences to watch out for in `lib/screens/experience_form.dart`:

### 1. Missing field: `ended_at` (`Tanggal Selesai Experience`)
- On the web, `ExperienceForm` has a 4th optional field: `ended_at` (`Tanggal Selesai Experience`, `blank=True, null=True` — when empty, `is_ongoing` is `True`).
- `experience_form.dart` currently doesn't have an end date input (e.g., a date picker or optional text field).

### 2. Category default & backend values
- **Default value**: Web defaults to `'full-time'` (`Full-Time`), while `experience_form.dart` defaults to `"Member"`.
- **Choice values (important for API integration later)**: Django's `EXPERIENCE_CHOICES` stores lowercase keys (`'internship'`, `'part-time'`, `'full-time'`, etc.) and only displays the capitalized labels (`'Full-Time'`). Right now your `DropdownMenuItem` uses the capitalized label as its `value`, which Django's serializer will reject when you connect it to the backend. Using a `Map<String, String>` (key = lowercase value, value = display label) will keep both UI and API aligned.

### 3. Small copy & state issues
- **Dialog typo**: `Text('Nama Proyek: $_experienceTitle')` still says `Nama Proyek` instead of `Nama Experience`.
- **Max length / hints** (minor): Web sets `maxlength: 255` on `title` (placeholder `"Experience Title"`) and placeholder `"Ceritakan Pengalamanmu"` on `description`.
- **State reset**: `_formKey.currentState!.reset()` clears the inputs visually, but doesn't reset `_experienceTitle`, `_description`, or `_category` in `setState`.

*(Side note: `ExperienceFormPage` isn't wired up in `lib/widgets/project_card.dart` or `lib/widgets/left_drawer.dart` yet if you want to navigate to it from the menu/drawer.)*

## User

fix number 2 and 3

## Assistant

Fixed items 2 and 3 in `lib/screens/experience_form.dart`:

- **Category values & default**: Changed `_category` default to `'full-time'` and converted `_categories` to a `Map<String, String>` mapping Django choice keys (`'internship'`, `'part-time'`, `'full-time'`, etc.) to their display labels.
- **Copy, hints & max length**: Fixed `'Nama Proyek'` → `'Nama Experience'` in the confirmation dialog, updated hints to `"Experience Title"` (with `maxLength: 255`) and `"Ceritakan Pengalamanmu"`, and displayed the readable category label in the dialog.
- **State reset**: Reset `_experienceTitle`, `_description`, and `_category` in `setState` alongside `_formKey.currentState!.reset()`.

Verified with `flutter analyze` — **No issues found**.

## User

```dart
setState(() {
  _experienceTitle = "";
  _description = "";
  _category = "full-time";
});
```

what this part do? its not on my project_form

## Assistant

`_formKey.currentState!.reset()` only clears the form fields **visually** — it does **not** call `onChanged`, so your Dart state variables (`_experienceTitle`, `_description`, `_category`) still keep the old values from the previous submission.

Without that `setState(...)` block:
- Suppose you select **Internship** and submit, then click **OK**.
- `_formKey.currentState!.reset()` visually resets the dropdown back to **Full-Time**, **but `_category` is still `"internship"`** in memory.
- If you submit a second entry without touching the dropdown, it would still display/send `"internship"` instead of `"full-time"`.
- The same bug happens with optional fields (like `thumbnail` or `project_link` in `project_form.dart`): leaving an optional field blank on a second submit would accidentally reuse the value from the first submit.

`setState(...)` keeps your state variables in sync with the cleared form.

## User

check which part I havent done yet and already *(melampirkan screenshot checklist Tugas 8)*

## Assistant

Here's your progress against the checklist:

### Already Done
1. **Halaman Formulir Baru**
   - `lib/screens/experience_form.dart` is in `lib/screens/` using `StatefulWidget`, `Form`, and `GlobalKey<FormState>`.
   - Has 3 inputs matching your `Experience` model (`Nama Experience`, `Deskripsi Experience`, `Kategori Experience`) using `TextFormField` and `DropdownButtonFormField`.
   - Validates required fields against empty/whitespace-only values (`.trim().isEmpty`) and enforces `maxLength: 255` on title.
   - Uses `Scaffold`, `AppBar`, and `SingleChildScrollView` so the form and Save button stay accessible on narrow screens / when the keyboard is open.
2. **Navigasi dari Halaman Utama dan Drawer**
   - `lib/widgets/project_card.dart` opens `ExperienceFormPage` via `Navigator.push()` when tapping `"Tambah Experience"`.
   - `lib/widgets/left_drawer.dart` keeps `Home` and `Add Project`, adds `Add Experience`, and is reused in `ExperienceFormPage`.
   - Drawer `Home` navigates back to `MyHomePage()`.
3. **Validasi dan Dialog Ringkasan**
   - Save button calls `_formKey.currentState!.validate()` and displays field errors when invalid.
   - `showDialog()` displays all entered values in an `AlertDialog` only after validation passes, with an `OK` button that closes the dialog and resets the form.
4. **Static Analysis**
   - `flutter analyze` passes with **No issues found**.

### Not Done Yet / Needs Attention
1. **Update `README.md`** — Still only has Week 1 / Tugas 7. Add Pertanyaan Reflektif and AI Disclosure for Tugas 8 / Week 2 (and optionally update Project Structure & Weekly Progress).
2. **Manual Testing** — Verify opening the form from card & drawer, invalid/valid submission, and returning to Home in Chrome/emulator.
3. **Git Commit & Push** — Commit and push `README.md` once updated.
4. *(Optional)* Add optional `ended_at` date picker using `showDatePicker()` for full parity with the Django `Experience` model.

## User

add showDatePicker

## Assistant

Added an optional `Tanggal Selesai Experience` (`ended_at`) date picker using `showDatePicker()` in `lib/screens/experience_form.dart`:

- **Date picker field**: Read-only `TextFormField` that opens `showDatePicker()` on tap or via the calendar icon, formats the date as `YYYY-MM-DD`, and includes a clear (`×`) icon button to reset it back to ongoing (`null`).
- **Controller lifecycle**: Disposes `_endedAtController` in `dispose()`.
- **Dialog & reset**: Displays the chosen date (or `"Masih berlangsung"` when empty) in the confirmation `AlertDialog`, and clears `_endedAt` and `_endedAtController` when clicking `OK`.

Verified with `flutter analyze` — **No issues found**.

## User

can you check which part I have and haven't done again

## Assistant

All code requirements are now complete!

### Already Done
1. **Halaman Formulir Baru** (`lib/screens/experience_form.dart`) — Uses `StatefulWidget`, `Form`, `GlobalKey<FormState>`, all 4 `Experience` inputs including `showDatePicker()`, validation for empty/whitespace-only inputs, and `SingleChildScrollView`.
2. **Navigasi dari Halaman Utama dan Drawer** — `ItemCard` opens `ExperienceFormPage` via `Navigator.push()`, and `LeftDrawer` includes `Home`, `Add Project`, and `Add Experience`.
3. **Validasi dan Dialog Ringkasan** — Calls `_formKey.currentState!.validate()`, shows `AlertDialog` via `showDialog()` with all 4 fields and an `OK` button to close and reset.
4. **Static Analysis & Code Push** — `flutter analyze` passes with **No issues found**; latest commit (`a663ad1`) is pushed to `origin/tugas8`.

### Still Not Done Yet
1. **Update `README.md`** — Add Pertanyaan Reflektif and AI Disclosure for Tugas 8 / Week 2 (and optionally update Project Structure & Weekly Progress).
2. **Manual Testing** — Test card & drawer navigation, invalid & valid inputs (including picking/clearing a date), and returning to Home.
3. **Final `git add`, `git commit`, and `git push`** — Commit and push updated `README.md`.
