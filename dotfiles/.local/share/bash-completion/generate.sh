#!/usr/bin/env bash

### Initialize
COMPLETION_DIR="$HOME/.local/share/bash-completion/completions"
mkdir -p "$COMPLETION_DIR"
FALLBACK_URL="https://gitlab.com/megabyte-labs/misc/dotfiles/-/raw/master/dotfiles/.local/share/bash-completion/completions"

### Deno
if command -v deno > /dev/null; then
  deno completions bash > "$COMPLETION_DIR/deno.bash"
elif [ -f "$COMPLETION_DIR/deno.bash" ]; then
  rm "$COMPLETION_DIR/deno.bash"
fi

### direnv
if command -v direnv > /dev/null; then
  direnv hook bash > "$COMPLETION_DIR/direnv.bash"
elif [ -f "$COMPLETION_DIR/direnv.bash" ]; then
  rm "$COMPLETION_DIR/direnv.bash"
fi

### fd
if command -v fd > /dev/null && command -v brew > /dev/null && [ -f "$(brew --prefix fd)/etc/bash_completion.d/fd" ]; then
  cp "$(brew --prefix fd)/etc/bash_completion.d/fd" "$COMPLETION_DIR/fd.bash"
elif command -v fd > /dev/null; then
  curl -sSL "$FALLBACK_URL/fd.bash" > "$COMPLETION_DIR/fd.bash"
elif [ -f "$COMPLETION_DIR/fd.bash" ]; then
  rm "$COMPLETION_DIR/fd.bash"
fi

### fig
if command -v fig > /dev/null; then
  fig completion bash > "$COMPLETION_DIR/fig.bash"
elif [ -f "$COMPLETION_DIR/fig.bash" ]; then
  rm "$COMPLETION_DIR/fig.bash"
fi

### fzf
if command -v fzf > /dev/null && command -v brew > /dev/null && [ -f "$(brew --prefix fzf)/shell/completion.bash" ]; then
  cp "$(brew --prefix fzf)/shell/completion.bash" "$COMPLETION_DIR/fzf.bash"
  cp "$(brew --prefix fzf)/shell/key-bindings.bash" "$COMPLETION_DIR/fzf-key-bindings.bash"
elif command -v fzf > /dev/null; then
  curl -sSL "$FALLBACK_URL/fzf.bash" > "$COMPLETION_DIR/fzf.bash"
  curl -sSL "$FALLBACK_URL/fzf-key-bindings.bash" > "$COMPLETION_DIR/fzf-key-bindings.bash"
elif [ -f "$COMPLETION_DIR/fzf.bash" ]; then
  rm "$COMPLETION_DIR/fzf.bash"
  rm "$COMPLETION_DIR/fzf-key-bindings.bash"
fi

### gh
if command -v gh > /dev/null; then
  gh completion -s bash > "$COMPLETION_DIR/gh.bash"
elif [ -f "$COMPLETION_DIR/gh.bash" ]; then
  rm "$COMPLETION_DIR/gh.bash"
fi

### Google Cloud SDK
if command -v gcloud > /dev/null; then
  curl -sSL "$FALLBACK_URL/gcloud.bash" > "COMPLETION_DIR/gcloud.bash"
elif [ -f "$COMPLETION_DIR/gcloud.bash" ]; then
  rm "$COMPLETION_DIR/gcloud.bash"
fi

### Googler
if command -v googler > /dev/null && command -v brew > /dev/null && [ -f "$(brew --prefix googler)/etc/bash_completion.d/googler-completion.bash" ]; then
  cp "$(brew --prefix googler)/etc/bash_completion.d/googler-completion.bash" "$COMPLETION_DIR/googler.bash"
elif command -v googler > /dev/null; then
  curl -sSL "$FALLBACK_URL/googler.bash" > "$COMPLETION_DIR/googler.bash"
elif [ -f "$COMPLETION_DIR/googler.bash" ]; then
  rm "$COMPLETION_DIR/googler.bash"
fi

### Gradle
if command -v gradle > /dev/null; then
  curl -sSL https://raw.githubusercontent.com/eriwen/gradle-completion/master/gradle-completion.bash > "$COMPLETION_DIR/gradle.bash"
elif [ -f "$COMPLETION_DIR/gradle.bash" ]; then
  rm "$COMPLETION_DIR/gradle.bash"
fi

### Helm
if command -v helm > /dev/null; then
  helm completion bash > "$COMPLETION_DIR/helm.bash"
elif [ -f "$COMPLETION_DIR/helm.bash" ]; then
  rm "$COMPLETION_DIR/helm.bash"
fi

### Hyperfine
if command -v hyperfine > /dev/null && command -v brew > /dev/null && [ -f "$(brew --prefix hyperfine)/etc/bash_completion.d/hyperfine.bash" ]; then
  cp "$(brew --prefix hyperfine)/etc/bash_completion.d/hyperfine.bash" "$COMPLETION_DIR/hyperfine.bash"
elif command -v hyperfine > /dev/null; then
  curl -sSL "$FALLBACK_URL/hyperfine.bash" > "$COMPLETION_DIR/hyperfine.bash"
elif [ -f "$COMPLETION_DIR/hyperfine.bash" ]; then
  rm "$COMPLETION_DIR/hyperfine.bash"
fi

### kubectl
if command -v kubectl > /dev/null; then
  kubectl completion bash > "$COMPLETION_DIR/kubectl.bash"
elif [ -f "$COMPLETION_DIR/kubectl.bash" ]; then
  rm "$COMPLETION_DIR/kubectl.bash"
fi

### mcfly
export MCFLY_KEY_SCHEME=vim
if command -v mcfly > /dev/null; then
  mcfly init bash > "$COMPLETION_DIR/mcfly.bash"
elif [ -f "$COMPLETION_DIR/mcfly.bash" ]; then
  rm "$COMPLETION_DIR/mcfly.bash"
fi

### nb
if command -v nb > /dev/null && command -v brew > /dev/null && [ -f "$(brew --prefix nb)/etc/bash_completion.d/nb.bash" ]; then
  cp "$(brew --prefix nb)/etc/bash_completion.d/nb.bash" "$COMPLETION_DIR/nb.bash"
elif command -v nb > /dev/null; then
  curl -sSL "$FALLBACK_URL/nb.bash" > "$COMPLETION_DIR/nb.bash"
elif [ -f "$COMPLETION_DIR/nb.bash" ]; then
  rm "$COMPLETION_DIR/nb.bash"
fi

### nnn
if command -v nnn > /dev/null && command -v brew > /dev/null && [ -f "$(brew --prefix nnn)/etc/bash_completion.d/nnn-completion.bash" ]; then
  cp "$(brew --prefix nnn)/etc/bash_completion.d/nnn-completion.bash" "$COMPLETION_DIR/nnn.bash"
elif command -v nnn > /dev/null; then
  curl -sSL "$FALLBACK_URL/nnn.bash" > "$COMPLETION_DIR/nnn.bash"
elif [ -f "$COMPLETION_DIR/nnn.bash" ]; then
  rm "$COMPLETION_DIR/nnn.bash"
fi

### npm
if command -v npm > /dev/null; then
  npm completion > "$COMPLETION_DIR/npm.bash"
elif [ -f "$COMPLETION_DIR/npm.bash" ]; then
  rm "$COMPLETION_DIR/npm.bash"
fi

### Poetry
if command -v poetry > /dev/null; then
  poetry completions bash > "$COMPLETION_DIR/poetry.bash"
elif [ -f "$COMPLETION_DIR/poetry.bash" ]; then
  rm "$COMPLETION_DIR/poetry.bash"
fi

### Volta
if command -v volta > /dev/null; then
  volta completions bash > "$COMPLETION_DIR/volta.bash"
elif [ -f "$COMPLETION_DIR/volta.bash" ]; then
  rm "$COMPLETION_DIR/volta.bash"
fi

### wp-cli (only bash available)
if command -v wp > /dev/null; then
  curl -sSL https://raw.githubusercontent.com/wp-cli/wp-cli/v2.7.1/utils/wp-completion.bash > "$COMPLETION_DIR/wp.bash"
elif [ -f "$COMPLETION_DIR/wp.bash" ]; then
  rm "$COMPLETION_DIR/wp.bash"
fi

### zoxide
if command -v zoxide >/dev/null; then
  zoxide init bash > "$COMPLETION_DIR/zoxide.bash"
elif [ -f "$COMPLETION_DIR/zoxide.bash" ]; then
  rm "$COMPLETION_DIR/zoxide.bash"
fi
