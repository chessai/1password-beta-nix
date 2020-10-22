{ appimageTools, fetchurl, lib }:

let
  pname = "1password";
  version = "beta";
in
appimageTools.wrapType2 rec {
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://downloads.1password.com/linux/appimage/1password-latest.AppImage";
    sha256 = "109jsls4515y78zhhsxqlgms30i5rzhi60p3b9wx6y8v0iq331wp";
  };

  profile = ''
    export LC_ALL=C.UTF-8
  '';

  multiPkgs = null; # no 32-bit needed

  extraPkgs = p: (appimageTools.defaultFhsEnvArgs.multiPkgs p)
    ++ [ p.at-spi2-atk p.at-spi2-core ];

  extraInstallCommands = ''
    mv $out/bin/{${name},${pname}};
  '';

  # TODO: add remaining fields
  meta = with lib; {
    platforms = [ "x86_64-linux" ];
  };
}
