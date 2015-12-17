set --query fish_greeting
and set --erase fish_greeting

if isatty
    if test -d ~/.config/fish/environment.d
        set environment_configs (find ~/.config/fish/environment.d -type f -name \*.fish)
        for config in $environment_configs
            source $config
        end
    end
    if test -d ~/.config/fish/functions.d
      set function_paths (find $HOME/.config/fish/functions.d -type d -mindepth 1 | grep --invert-match --extended-regexp "$HOME/.config/fish/functions.d(.*/\.)+")
      for path in $function_paths
          contains $path $fish_function_path
          or set fish_function_path $fish_function_path $path
      end
    end
end
