# mutation-testing-workshop

Fish:

```fish
git clone https://github.com/boxed/scientist.git
cd scientist
rm tests/*
touch tests/test_scientist.py
virtualenv -p (which python3) venv
source venv/bin/activate.fish
pip install pytest
pip install mutmut
mutmut run
```

Bash:

```bash
git clone https://github.com/boxed/scientist.git
cd scientist
rm tests/*
touch tests/test_scientist.py
virtualenv -p $(which python3) venv
source venv/bin/activate
pip install pytest
pip install mutmut
mutmut run
```

Mutmut will give an error, because there are no tests in tests/test_scientist.py!
