{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {
  name = "xr-uk-constitution";

  buildInputs = [ (texlive.combine {
                    inherit (texlive)
                      scheme-small

                      # Fonts
                      crimson fontaxes mweights

                      # Add other LaTeX libraries (packages) here as needed, e.g:
                      titlesec enumitem

                      # build tools
                      latexmk
                      ;
                  })

                ];
  src = ./.;
  buildPhase = "make";

  meta = with lib; {
    description = "The official Constitution of Extinction Rebellion UK";
  };
}
