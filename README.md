# custom-prompt

My custom command line prompt.

```bash
[${your-user}@${hostname}] ${current-directory} 

# if in git directory
[${your-user}@${hostname}] ${current-directory} [${current-branch}]
```

## Install

```
git clone https://github.com/gturi/custom-prompt.git
```

Run `installer-for-bash.sh` or `installer-for-zsh.sh` script. The changes will be loaded from the next terminal session you will open.

## Update

```
./update.sh
```

## Uninstall

Remove the following lines from your `.bashrc` or your `.zshrc`:

```bash
# get git branch name
if ...
fi

# setup custom prompt
if ...
fi
```