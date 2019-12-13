# Mutation testing workshop

## Setup


```bash
curl https://raw.githubusercontent.com/boxed/mutation-testing-workshop/master/start.sh | bash
cd scientist
source venv/bin/activate
```


## Run tests

```bash
python -m pytest
```

## Run mutation testing

```bash
mutmut run
```

Now write tests in `tests/test_scientist.py` and rerun mutmut until you have no surviving mutants!

Commands:

- `mutmut show`: see the list of mutants
- `mutmut show 4`: show mutant 4
- `mutmut show all`: see all the mutant diffs
- `mutmut apply 4`: apply the mutant 4 to disk
- `python -m pytest`: run tests


Tips:

- It can be useful to look at a few mutants at a time, especially if they are on the same line
- Mutation testing can be played in two ways:
  - Look at the diff, write a test that passes, do `mutmut run` to see if you wrote the test properly
  - Apply the mutant on disk, write a test that fails, revert the mutant, check that the test succeeds. You want to do `mutmut run` after too.
