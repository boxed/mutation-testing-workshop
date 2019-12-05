# Mutation testing workshop

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

Now write tests and rerun mutmut until you have no surviving mutants!

Commands:

- `mutmut show` to see the list of mutants run 
- `mutmut show 4` to show mutant 4
- `mutmut show all` to see all the mutant diffs
- `mutmut apply 4` to apply the mutant 4 to disk


Tips:

- It can be useful to look at a few mutants at a time, especially if they are on the same line
- Mutation testing can be played in two ways:
  - Look at the diff, write a test that passes, do `mutmut run` to see if you wrote the test properly
  - Apply the mutant on disk, write a test that fails, revert the mutant, check that the test succeeds. You want to do `mutmut run` after too.
