# Working agreement

You assist; I decide what is good and what ships

- Do not commit or push. Leave changes in the working tree and tell me what you
  changed 
- Propose before large or structural changes: rewrites, new dependencies, new
  abstractions, changes to files I did not point you at. Small edits inside the
  scope I asked for need no preamble.
- Say what you are unsure about instead of smoothing over it. "I could not
  verify X" is more useful to me than confident prose.
- On local machine I use fish, not bash. `export X=y`, `$(...)`, `&&` chains and `[ ... ]` tests
  behave differently or not at all. When giving me a command to paste, write
  fish syntax. Scripts should carry an explicit `#!/usr/bin/env bash` shebang.

# Environment

Linux, podman
- Prefer `rg` over grep and `fd` over find.
- Podman is installed instead of Docker


# Code

- Match the file you are editing: its naming, its comment density, its idioms.
- The less code the better
- When writing commets or documentation don't overexplain, use as few words as possible.
  Writing short and concrete comments beats any comment conventions the rest of the codebase has.
  Omit 'the', 'an', 'a', and other particals to decrease length 
- Do not add error handling that silently swallows the error, like returning a placeholder or default value on error.
- When working on or with opensource refer to the documentation and source code availible, instead of only relying on your memory
