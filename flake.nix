{
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in
        {
          packages.libnpy = pkgs.stdenv.mkDerivation {
            name = "libnpy-1.0.1";
            src = ./.;
            installPhase = ''
              mkdir -p $out
              cp -r include $out
            '';
          };
        }
    );
}
