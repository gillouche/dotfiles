# dotfiles
dotfiles deployed with ansible

## Requirements
- python3, pip, python3-venv

## Setup
```bash
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

## Run
```bash
bash run.sh
```

Additionally, the verbosity can be passed to the script

```bash
bash run.sh -vvvv
```

which will print the facts (for -vvvv only) and exits (if 4).

