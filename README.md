# SceneBnB 🎬

A MakersBnB-inspired property rental web app built with Python and Flask.

---

## ⚠️ Important Notes

- **Running tests or the app?** You must prefix commands with `APP_ENV=test` when using the test database:
  ```
  APP_ENV=test pytest
  APP_ENV=test python app.py
  ```
  Without this, tests will fail as they won't use the test database.

- **`ModuleNotFoundError`?** Deactivate and reactivate your virtual environment. If that doesn't resolve it, reach out to your coach.

---

## Setup

### 1. Create and activate the virtual environment

```bash
python -m venv makersbnb-venv
source makersbnb-venv/bin/activate
```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

### 3. Install the virtual browser (for testing)

```bash
playwright install
```

### 4. Create the databases

```bash
createdb scenebnb
createdb scenebnb_test
```

### 5. Update the database connection config

```bash
open lib/database_connection.py
```

Update the database names to match the ones you created above.

### 6. Run the tests

```bash
APP_ENV=test pytest -sv
```

### 7. Run the app

```bash
python app.py
```

Then visit [http://localhost:5001](http://localhost:5001) in your browser.

---

## Tech Stack

- **Backend**: Python, Flask
- **Database**: PostgreSQL
- **Testing**: pytest, Playwright