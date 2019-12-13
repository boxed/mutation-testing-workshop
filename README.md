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

- `mutmut show` to see the list of mutants run 
- `mutmut show 4` to show mutant 4
- `mutmut show all` to see all the mutant diffs
- `mutmut apply 4` to apply the mutant 4 to disk


Tips:

- It can be useful to look at a few mutants at a time, especially if they are on the same line
- Mutation testing can be played in two ways:
  - Look at the diff, write a test that passes, do `mutmut run` to see if you wrote the test properly
  - Apply the mutant on disk, write a test that fails, revert the mutant, check that the test succeeds. You want to do `mutmut run` after too.
