# kotlin-lsp-nix

This is a flake that packages the
[official Kotlin Language Server](https://github.com/Kotlin/kotlin-lsp).

It's a fork from [this project by poz](https://git.poz.pet/poz/kotlin-lsp-nix)
with added CI to automatically update the package.

The package is taken from
[kotlin-lsp: init at 262.4739.0](https://github.com/NixOS/nixpkgs/pull/514623)
and all credit for it goes to [bew](https://github.com/bew).

This repository will be abandoned once `kotlin-lsp` is fully open-sourced
and a nix package is merged into nixpkgs
(see [britter's comment on the matter](https://github.com/NixOS/nixpkgs/pull/514623#issuecomment-4497337202)).
